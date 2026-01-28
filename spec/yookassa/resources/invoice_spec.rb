# frozen_string_literal: true

RSpec.describe Yookassa::Resources::Invoice do
  let(:client) { Yookassa::Client.new(shop_id: "123456", api_key: "test_key") }
  subject(:resource) { described_class.new(client) }

  let(:base_url) { "https://api.yookassa.ru/v3" }

  let(:invoice_json) do
    {
      id: "inv-5001",
      status: "pending",
      cart: [
        { description: "Test product", amount: { value: "500.00", currency: "RUB" }, quantity: 1 }
      ],
      created_at: "2024-01-15T12:00:00.000Z"
    }.to_json
  end

  describe "#create" do
    before do
      stub_request(:post, "#{base_url}/invoices")
        .to_return(status: 200, body: invoice_json, headers: { "Content-Type" => "application/json" })
    end

    it "creates an invoice" do
      invoice = resource.create({ cart: [{ description: "Test product", amount: { value: "500.00", currency: "RUB" }, quantity: 1 }] })
      expect(invoice).to be_a(Yookassa::Entities::Base)
      expect(invoice.id).to eq("inv-5001")
    end

    it "sends POST request with JSON body" do
      resource.create({ cart: [] })
      expect(WebMock).to have_requested(:post, "#{base_url}/invoices")
        .with(body: hash_including("cart"))
    end

    it "sends Idempotence-Key header" do
      resource.create({ cart: [] }, idempotency_key: "inv-key")
      expect(WebMock).to have_requested(:post, "#{base_url}/invoices")
        .with(headers: { "Idempotence-Key" => "inv-key" })
    end
  end

  describe "#find" do
    before do
      stub_request(:get, "#{base_url}/invoices/inv-5001")
        .to_return(status: 200, body: invoice_json, headers: { "Content-Type" => "application/json" })
    end

    it "finds an invoice by id" do
      invoice = resource.find("inv-5001")
      expect(invoice).to be_a(Yookassa::Entities::Base)
      expect(invoice.id).to eq("inv-5001")
    end

    it "returns an invoice with correct status" do
      invoice = resource.find("inv-5001")
      expect(invoice.status).to eq("pending")
    end
  end
end
