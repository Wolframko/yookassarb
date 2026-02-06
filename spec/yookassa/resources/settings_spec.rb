# frozen_string_literal: true

RSpec.describe Yookassa::Resources::Settings do
  let(:client) { Yookassa::Client.new(shop_id: "123456", api_key: "test_key") }
  subject(:resource) { described_class.new(client) }

  let(:base_url) { "https://api.yookassa.ru/v3" }

  let(:settings_json) do
    {
      account_id: "123456",
      status: "enabled",
      name: "Test Shop",
      fiscalization: { enabled: true },
      payment_methods: ["bank_card", "yoo_money"]
    }.to_json
  end

  describe "#retrieve" do
    before do
      stub_request(:get, "#{base_url}/me")
        .to_return(status: 200, body: settings_json, headers: { "Content-Type" => "application/json" })
    end

    it "retrieves account settings" do
      settings = resource.retrieve
      expect(settings).to be_a(Yookassa::Entities::Base)
      expect(settings.account_id).to eq("123456")
    end

    it "sends GET request to /me" do
      resource.retrieve
      expect(WebMock).to have_requested(:get, "#{base_url}/me")
    end

    it "returns settings with correct attributes" do
      settings = resource.retrieve
      expect(settings.status).to eq("enabled")
      expect(settings.name).to eq("Test Shop")
    end
  end
end
