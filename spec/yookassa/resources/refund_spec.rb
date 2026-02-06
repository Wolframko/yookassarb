# frozen_string_literal: true

RSpec.describe Yookassa::Resources::Refund do
  let(:client) { Yookassa::Client.new(shop_id: "123456", api_key: "test_key") }
  subject(:resource) { described_class.new(client) }

  let(:base_url) { "https://api.yookassa.ru/v3" }

  describe "#create" do
    before do
      stub_request(:post, "#{base_url}/refunds")
        .to_return(status: 200, body: fixture("refund.json"), headers: { "Content-Type" => "application/json" })
    end

    it "creates a refund" do
      refund = resource.create({ payment_id: "pay-123", amount: { value: "50.00", currency: "RUB" } })
      expect(refund).to be_a(Yookassa::Entities::Refund)
      expect(refund.id).to eq("2a7834f6-refund-5000-a000-1da326e5e123")
    end

    it "sends POST request with JSON body" do
      resource.create({ payment_id: "pay-123", amount: { value: "50.00", currency: "RUB" } })
      expect(WebMock).to have_requested(:post, "#{base_url}/refunds")
        .with(body: hash_including("payment_id" => "pay-123"))
    end

    it "sends Idempotence-Key header" do
      resource.create({ payment_id: "pay-123", amount: { value: "50.00", currency: "RUB" } })
      expect(WebMock).to have_requested(:post, "#{base_url}/refunds")
        .with(headers: { "Idempotence-Key" => /\A[0-9a-f-]+\z/ })
    end

    it "uses custom idempotency_key" do
      resource.create({ payment_id: "pay-123" }, idempotency_key: "my-key")
      expect(WebMock).to have_requested(:post, "#{base_url}/refunds")
        .with(headers: { "Idempotence-Key" => "my-key" })
    end
  end

  describe "#find" do
    before do
      stub_request(:get, "#{base_url}/refunds/ref-123")
        .to_return(status: 200, body: fixture("refund.json"), headers: { "Content-Type" => "application/json" })
    end

    it "finds a refund by id" do
      refund = resource.find("ref-123")
      expect(refund).to be_a(Yookassa::Entities::Refund)
      expect(refund.id).to eq("2a7834f6-refund-5000-a000-1da326e5e123")
    end

    it "returns a refund with correct status" do
      refund = resource.find("ref-123")
      expect(refund.succeeded?).to be true
    end
  end

  describe "#list" do
    let(:list_body) do
      {
        items: [
          { id: "ref-1", status: "succeeded", amount: { value: "50.00", currency: "RUB" }, payment_id: "pay-1" },
          { id: "ref-2", status: "succeeded", amount: { value: "30.00", currency: "RUB" }, payment_id: "pay-2" }
        ],
        next_cursor: "ref-2"
      }.to_json
    end

    before do
      stub_request(:get, "#{base_url}/refunds")
        .with(query: hash_including("payment_id" => "pay-1"))
        .to_return(status: 200, body: list_body, headers: { "Content-Type" => "application/json" })
    end

    it "returns a collection of refunds" do
      result = resource.list(payment_id: "pay-1")
      expect(result).to be_a(Yookassa::Entities::Collection)
      expect(result.size).to eq(2)
      expect(result.items.first).to be_a(Yookassa::Entities::Refund)
    end

    it "supports pagination cursor" do
      result = resource.list(payment_id: "pay-1")
      expect(result.has_next?).to be true
      expect(result.next_cursor).to eq("ref-2")
    end
  end
end
