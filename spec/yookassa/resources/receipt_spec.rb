# frozen_string_literal: true

RSpec.describe Yookassa::Resources::Receipt do
  let(:client) { Yookassa::Client.new(shop_id: "123456", api_key: "test_key") }
  subject(:resource) { described_class.new(client) }

  let(:base_url) { "https://api.yookassa.ru/v3" }

  let(:receipt_json) do
    {
      id: "rt-1001",
      type: "payment",
      status: "succeeded",
      payment_id: "pay-123",
      items: [
        { description: "Test item", quantity: "1.00", amount: { value: "100.00", currency: "RUB" }, vat_code: 1 }
      ]
    }.to_json
  end

  describe "#create" do
    before do
      stub_request(:post, "#{base_url}/receipts")
        .to_return(status: 200, body: receipt_json, headers: { "Content-Type" => "application/json" })
    end

    it "creates a receipt" do
      receipt = resource.create({ payment_id: "pay-123", type: "payment", items: [] })
      expect(receipt).to be_a(Yookassa::Entities::Receipt)
      expect(receipt.id).to eq("rt-1001")
    end

    it "sends POST request with JSON body" do
      resource.create({ payment_id: "pay-123", type: "payment", items: [] })
      expect(WebMock).to have_requested(:post, "#{base_url}/receipts")
        .with(body: hash_including("payment_id" => "pay-123"))
    end

    it "sends Idempotence-Key header" do
      resource.create({ payment_id: "pay-123" }, idempotency_key: "custom-key")
      expect(WebMock).to have_requested(:post, "#{base_url}/receipts")
        .with(headers: { "Idempotence-Key" => "custom-key" })
    end
  end

  describe "#find" do
    before do
      stub_request(:get, "#{base_url}/receipts/rt-1001")
        .to_return(status: 200, body: receipt_json, headers: { "Content-Type" => "application/json" })
    end

    it "finds a receipt by id" do
      receipt = resource.find("rt-1001")
      expect(receipt).to be_a(Yookassa::Entities::Receipt)
      expect(receipt.id).to eq("rt-1001")
    end

    it "returns a receipt with correct status" do
      receipt = resource.find("rt-1001")
      expect(receipt.succeeded?).to be true
    end
  end

  describe "#list" do
    let(:list_body) do
      {
        items: [
          { id: "rt-1001", type: "payment", status: "succeeded", payment_id: "pay-123" },
          { id: "rt-1002", type: "payment", status: "succeeded", payment_id: "pay-123" }
        ],
        next_cursor: "rt-1002"
      }.to_json
    end

    before do
      stub_request(:get, "#{base_url}/receipts")
        .with(query: hash_including("payment_id" => "pay-123"))
        .to_return(status: 200, body: list_body, headers: { "Content-Type" => "application/json" })
    end

    it "returns a collection of receipts" do
      result = resource.list(payment_id: "pay-123")
      expect(result).to be_a(Yookassa::Entities::Collection)
      expect(result.size).to eq(2)
      expect(result.items.first).to be_a(Yookassa::Entities::Receipt)
    end

    it "supports pagination cursor" do
      result = resource.list(payment_id: "pay-123")
      expect(result.has_next?).to be true
      expect(result.next_cursor).to eq("rt-1002")
    end
  end
end
