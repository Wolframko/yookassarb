# frozen_string_literal: true

RSpec.describe Yookassa::Resources::Payment do
  let(:client) { Yookassa::Client.new(shop_id: "123456", api_key: "test_key") }
  subject(:resource) { described_class.new(client) }

  let(:base_url) { "https://api.yookassa.ru/v3" }

  describe "#create" do
    before do
      stub_request(:post, "#{base_url}/payments")
        .to_return(status: 200, body: fixture("payment.json"), headers: { "Content-Type" => "application/json" })
    end

    it "creates a payment" do
      payment = resource.create({ amount: { value: "100.00", currency: "RUB" } })
      expect(payment).to be_a(Yookassa::Entities::Payment)
      expect(payment.id).to eq("2a7834f6-0001-5000-a000-1da326e5e123")
    end

    it "sends POST request with JSON body" do
      resource.create({ amount: { value: "100.00", currency: "RUB" } })
      expect(WebMock).to have_requested(:post, "#{base_url}/payments")
        .with(body: hash_including("amount" => { "value" => "100.00", "currency" => "RUB" }))
    end

    it "sends Idempotence-Key header" do
      resource.create({ amount: { value: "100.00", currency: "RUB" } })
      expect(WebMock).to have_requested(:post, "#{base_url}/payments")
        .with(headers: { "Idempotence-Key" => /\A[0-9a-f-]+\z/ })
    end

    it "uses custom idempotency_key" do
      resource.create({ amount: { value: "100.00", currency: "RUB" } }, idempotency_key: "my-key")
      expect(WebMock).to have_requested(:post, "#{base_url}/payments")
        .with(headers: { "Idempotence-Key" => "my-key" })
    end
  end

  describe "#find" do
    before do
      stub_request(:get, "#{base_url}/payments/pay-123")
        .to_return(status: 200, body: fixture("payment.json"), headers: { "Content-Type" => "application/json" })
    end

    it "finds a payment by id" do
      payment = resource.find("pay-123")
      expect(payment).to be_a(Yookassa::Entities::Payment)
    end
  end

  describe "#capture" do
    before do
      stub_request(:post, "#{base_url}/payments/pay-123/capture")
        .to_return(status: 200, body: fixture("payment_succeeded.json"), headers: { "Content-Type" => "application/json" })
    end

    it "captures a payment" do
      payment = resource.capture("pay-123", { amount: { value: "100.00", currency: "RUB" } })
      expect(payment.succeeded?).to be true
    end
  end

  describe "#cancel" do
    before do
      stub_request(:post, "#{base_url}/payments/pay-123/cancel")
        .to_return(
          status: 200,
          body: '{"id":"pay-123","status":"canceled"}',
          headers: { "Content-Type" => "application/json" }
        )
    end

    it "cancels a payment" do
      payment = resource.cancel("pay-123")
      expect(payment.canceled?).to be true
    end
  end

  describe "#list" do
    before do
      stub_request(:get, "#{base_url}/payments")
        .with(query: hash_including("status" => "succeeded"))
        .to_return(status: 200, body: fixture("payment_list.json"), headers: { "Content-Type" => "application/json" })
    end

    it "returns a collection" do
      result = resource.list(status: "succeeded")
      expect(result).to be_a(Yookassa::Entities::Collection)
      expect(result.size).to eq(2)
      expect(result.items.first).to be_a(Yookassa::Entities::Payment)
    end
  end

  describe "error handling" do
    it "raises BadRequestError on 400" do
      stub_request(:post, "#{base_url}/payments")
        .to_return(status: 400, body: fixture("error_bad_request.json"), headers: { "Content-Type" => "application/json" })

      expect { resource.create({ amount: {} }) }.to raise_error(Yookassa::BadRequestError) do |e|
        expect(e.code).to eq("invalid_request")
        expect(e.parameter).to eq("amount")
      end
    end

    it "raises NotFoundError on 404" do
      stub_request(:get, "#{base_url}/payments/nonexistent")
        .to_return(status: 404, body: '{"code":"not_found","description":"Not found"}', headers: { "Content-Type" => "application/json" })

      expect { resource.find("nonexistent") }.to raise_error(Yookassa::NotFoundError)
    end
  end
end
