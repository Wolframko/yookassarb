# frozen_string_literal: true

RSpec.describe Yookassa::Configuration do
  subject(:config) { described_class.new }

  it "has default values" do
    expect(config.timeout).to eq(30)
    expect(config.max_retries).to eq(3)
    expect(config.retry_delay).to eq(1.8)
    expect(config.logger).to be_nil
  end

  describe "#validate!" do
    it "raises when shop_id is missing without auth_token" do
      config.api_key = "test"
      expect { config.validate! }.to raise_error(Yookassa::Error, /shop_id/)
    end

    it "raises when api_key is missing without auth_token" do
      config.shop_id = "123"
      expect { config.validate! }.to raise_error(Yookassa::Error, /api_key/)
    end

    it "does not raise when both shop_id and api_key are set" do
      config.shop_id = "123"
      config.api_key = "test"
      expect { config.validate! }.not_to raise_error
    end

    it "does not raise when auth_token is set" do
      config.auth_token = "token_123"
      expect { config.validate! }.not_to raise_error
    end
  end

  describe "#credentials" do
    it "returns shop_id/api_key when no auth_token" do
      config.shop_id = "123"
      config.api_key = "key"
      expect(config.credentials).to eq(shop_id: "123", api_key: "key")
    end

    it "returns auth_token when set" do
      config.auth_token = "token_123"
      expect(config.credentials).to eq(auth_token: "token_123")
    end
  end
end
