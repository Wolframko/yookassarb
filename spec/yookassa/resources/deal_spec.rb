# frozen_string_literal: true

RSpec.describe Yookassa::Resources::Deal do
  let(:client) { Yookassa::Client.new(shop_id: "123456", api_key: "test_key") }
  subject(:resource) { described_class.new(client) }

  let(:base_url) { "https://api.yookassa.ru/v3" }

  let(:deal_json) do
    {
      id: "dl-3001",
      type: "safe_deal",
      status: "opened",
      balance: { value: "0.00", currency: "RUB" },
      payout_balance: { value: "0.00", currency: "RUB" },
      created_at: "2024-01-15T12:00:00.000Z"
    }.to_json
  end

  describe "#create" do
    before do
      stub_request(:post, "#{base_url}/deals")
        .to_return(status: 200, body: deal_json, headers: { "Content-Type" => "application/json" })
    end

    it "creates a deal" do
      deal = resource.create({ type: "safe_deal", fee_moment: "payment_succeeded" })
      expect(deal).to be_a(Yookassa::Entities::Deal)
      expect(deal.id).to eq("dl-3001")
    end

    it "sends POST request with JSON body" do
      resource.create({ type: "safe_deal", fee_moment: "payment_succeeded" })
      expect(WebMock).to have_requested(:post, "#{base_url}/deals")
        .with(body: hash_including("type" => "safe_deal"))
    end

    it "sends Idempotence-Key header" do
      resource.create({ type: "safe_deal" }, idempotency_key: "deal-key")
      expect(WebMock).to have_requested(:post, "#{base_url}/deals")
        .with(headers: { "Idempotence-Key" => "deal-key" })
    end
  end

  describe "#find" do
    before do
      stub_request(:get, "#{base_url}/deals/dl-3001")
        .to_return(status: 200, body: deal_json, headers: { "Content-Type" => "application/json" })
    end

    it "finds a deal by id" do
      deal = resource.find("dl-3001")
      expect(deal).to be_a(Yookassa::Entities::Deal)
      expect(deal.id).to eq("dl-3001")
    end

    it "returns a deal with correct status" do
      deal = resource.find("dl-3001")
      expect(deal.opened?).to be true
    end
  end

  describe "#list" do
    let(:list_body) do
      {
        items: [
          { id: "dl-3001", type: "safe_deal", status: "opened" },
          { id: "dl-3002", type: "safe_deal", status: "closed" }
        ],
        next_cursor: "dl-3002"
      }.to_json
    end

    before do
      stub_request(:get, "#{base_url}/deals")
        .with(query: hash_including("status" => "opened"))
        .to_return(status: 200, body: list_body, headers: { "Content-Type" => "application/json" })
    end

    it "returns a collection of deals" do
      result = resource.list(status: "opened")
      expect(result).to be_a(Yookassa::Entities::Collection)
      expect(result.size).to eq(2)
      expect(result.items.first).to be_a(Yookassa::Entities::Deal)
    end

    it "supports pagination cursor" do
      result = resource.list(status: "opened")
      expect(result.has_next?).to be true
      expect(result.next_cursor).to eq("dl-3002")
    end
  end
end
