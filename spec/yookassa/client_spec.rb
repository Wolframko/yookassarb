# frozen_string_literal: true

RSpec.describe Yookassa::Client do
  subject(:client) { described_class.new(shop_id: "123456", api_key: "test_key") }

  it "stores configuration" do
    expect(client.config.shop_id).to eq("123456")
    expect(client.config.api_key).to eq("test_key")
  end

  it "accepts custom options" do
    client = described_class.new(shop_id: "1", api_key: "k", timeout: 60, max_retries: 5)
    expect(client.config.timeout).to eq(60)
    expect(client.config.max_retries).to eq(5)
  end

  it "provides resource accessors" do
    expect(client.payments).to be_a(Yookassa::Resources::Payment)
    expect(client.refunds).to be_a(Yookassa::Resources::Refund)
    expect(client.receipts).to be_a(Yookassa::Resources::Receipt)
    expect(client.payouts).to be_a(Yookassa::Resources::Payout)
    expect(client.deals).to be_a(Yookassa::Resources::Deal)
    expect(client.webhooks).to be_a(Yookassa::Resources::Webhook)
    expect(client.invoices).to be_a(Yookassa::Resources::Invoice)
    expect(client.settings).to be_a(Yookassa::Resources::Settings)
  end

  it "memoizes resource instances" do
    expect(client.payments).to be(client.payments)
  end
end
