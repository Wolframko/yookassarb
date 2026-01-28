# frozen_string_literal: true

RSpec.describe Yookassa::Resources::Webhook do
  let(:client) { Yookassa::Client.new(shop_id: "123456", api_key: "test_key") }
  subject(:resource) { described_class.new(client) }

  let(:base_url) { "https://api.yookassa.ru/v3" }

  let(:webhook_json) do
    {
      id: "wh-4001",
      event: "payment.succeeded",
      url: "https://example.com/webhooks"
    }.to_json
  end

  describe "#create" do
    before do
      stub_request(:post, "#{base_url}/webhooks")
        .to_return(status: 200, body: webhook_json, headers: { "Content-Type" => "application/json" })
    end

    it "creates a webhook" do
      webhook = resource.create({ event: "payment.succeeded", url: "https://example.com/webhooks" })
      expect(webhook).to be_a(Yookassa::Entities::WebhookObj)
      expect(webhook.id).to eq("wh-4001")
    end

    it "sends POST request with JSON body" do
      resource.create({ event: "payment.succeeded", url: "https://example.com/webhooks" })
      expect(WebMock).to have_requested(:post, "#{base_url}/webhooks")
        .with(body: hash_including("event" => "payment.succeeded"))
    end

    it "sends Idempotence-Key header" do
      resource.create({ event: "payment.succeeded", url: "https://example.com/webhooks" }, idempotency_key: "wh-key")
      expect(WebMock).to have_requested(:post, "#{base_url}/webhooks")
        .with(headers: { "Idempotence-Key" => "wh-key" })
    end
  end

  describe "#list" do
    let(:list_body) do
      {
        items: [
          { id: "wh-4001", event: "payment.succeeded", url: "https://example.com/webhooks" },
          { id: "wh-4002", event: "payment.canceled", url: "https://example.com/webhooks" }
        ]
      }.to_json
    end

    before do
      stub_request(:get, "#{base_url}/webhooks")
        .to_return(status: 200, body: list_body, headers: { "Content-Type" => "application/json" })
    end

    it "returns a collection of webhooks" do
      result = resource.list
      expect(result).to be_a(Yookassa::Entities::Collection)
      expect(result.size).to eq(2)
      expect(result.items.first).to be_a(Yookassa::Entities::WebhookObj)
    end

    it "returns webhooks with correct attributes" do
      result = resource.list
      expect(result.items.first.event).to eq("payment.succeeded")
      expect(result.items.first.url).to eq("https://example.com/webhooks")
    end
  end

  describe "#delete" do
    before do
      stub_request(:delete, "#{base_url}/webhooks/wh-4001")
        .to_return(status: 200, body: "", headers: { "Content-Type" => "application/json" })
    end

    it "deletes a webhook and returns true" do
      result = resource.delete("wh-4001")
      expect(result).to be true
    end

    it "sends DELETE request" do
      resource.delete("wh-4001")
      expect(WebMock).to have_requested(:delete, "#{base_url}/webhooks/wh-4001")
    end
  end
end
