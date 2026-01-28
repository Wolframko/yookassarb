# frozen_string_literal: true

RSpec.describe Yookassa::Resources::Payout do
  let(:client) { Yookassa::Client.new(shop_id: "123456", api_key: "test_key") }
  subject(:resource) { described_class.new(client) }

  let(:base_url) { "https://api.yookassa.ru/v3" }

  let(:payout_json) do
    {
      id: "po-2001",
      status: "succeeded",
      amount: { value: "200.00", currency: "RUB" },
      payout_destination: { type: "bank_card", card: { last4: "1234" } },
      created_at: "2024-01-15T12:00:00.000Z"
    }.to_json
  end

  describe "#create" do
    before do
      stub_request(:post, "#{base_url}/payouts")
        .to_return(status: 200, body: payout_json, headers: { "Content-Type" => "application/json" })
    end

    it "creates a payout" do
      payout = resource.create({ amount: { value: "200.00", currency: "RUB" } })
      expect(payout).to be_a(Yookassa::Entities::Payout)
      expect(payout.id).to eq("po-2001")
    end

    it "sends POST request with JSON body" do
      resource.create({ amount: { value: "200.00", currency: "RUB" } })
      expect(WebMock).to have_requested(:post, "#{base_url}/payouts")
        .with(body: hash_including("amount" => { "value" => "200.00", "currency" => "RUB" }))
    end

    it "sends Idempotence-Key header" do
      resource.create({ amount: { value: "200.00", currency: "RUB" } }, idempotency_key: "po-key")
      expect(WebMock).to have_requested(:post, "#{base_url}/payouts")
        .with(headers: { "Idempotence-Key" => "po-key" })
    end
  end

  describe "#find" do
    before do
      stub_request(:get, "#{base_url}/payouts/po-2001")
        .to_return(status: 200, body: payout_json, headers: { "Content-Type" => "application/json" })
    end

    it "finds a payout by id" do
      payout = resource.find("po-2001")
      expect(payout).to be_a(Yookassa::Entities::Payout)
      expect(payout.id).to eq("po-2001")
    end

    it "returns a payout with correct status" do
      payout = resource.find("po-2001")
      expect(payout.succeeded?).to be true
    end
  end

  describe "#list" do
    let(:list_body) do
      {
        items: [
          { id: "po-2001", status: "succeeded", amount: { value: "200.00", currency: "RUB" } },
          { id: "po-2002", status: "canceled", amount: { value: "150.00", currency: "RUB" } }
        ],
        next_cursor: "po-2002"
      }.to_json
    end

    before do
      stub_request(:get, "#{base_url}/payouts")
        .with(query: hash_including("status" => "succeeded"))
        .to_return(status: 200, body: list_body, headers: { "Content-Type" => "application/json" })
    end

    it "returns a collection of payouts" do
      result = resource.list(status: "succeeded")
      expect(result).to be_a(Yookassa::Entities::Collection)
      expect(result.size).to eq(2)
      expect(result.items.first).to be_a(Yookassa::Entities::Payout)
    end

    it "supports pagination cursor" do
      result = resource.list(status: "succeeded")
      expect(result.has_next?).to be true
      expect(result.next_cursor).to eq("po-2002")
    end
  end
end
