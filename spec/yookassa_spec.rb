# frozen_string_literal: true

RSpec.describe Yookassa do
  describe ".configure" do
    it "yields configuration" do
      described_class.configure do |config|
        config.shop_id = "test_shop"
        config.api_key = "test_key"
      end

      expect(described_class.configuration.shop_id).to eq("test_shop")
      expect(described_class.configuration.api_key).to eq("test_key")
    end
  end

  describe ".reset_configuration!" do
    it "resets to defaults" do
      described_class.configure { |c| c.shop_id = "test" }
      described_class.reset_configuration!
      expect(described_class.configuration.shop_id).to be_nil
    end
  end

  describe ".default_client" do
    it "creates a client from global configuration" do
      described_class.configure do |c|
        c.shop_id = "shop"
        c.api_key = "key"
      end

      expect(described_class.default_client).to be_a(Yookassa::Client)
      expect(described_class.default_client.config.shop_id).to eq("shop")
    end
  end

  describe "class-level shortcuts" do
    before do
      described_class.configure do |c|
        c.shop_id = "123"
        c.api_key = "key"
      end

      stub_request(:post, "https://api.yookassa.ru/v3/payments")
        .to_return(status: 200, body: fixture("payment.json"), headers: { "Content-Type" => "application/json" })
    end

    it "Yookassa::Payment.create delegates to default client" do
      payment = Yookassa::Payment.create({ amount: { value: "100.00", currency: "RUB" } })
      expect(payment).to be_a(Yookassa::Entities::Payment)
    end
  end

  it "has a version number" do
    expect(Yookassa::VERSION).to eq("0.1.0")
  end
end
