# frozen_string_literal: true

RSpec.describe Yookassa::Entities::WebhookObj do
  subject(:webhook) { described_class.new("id" => "wh-001", "event" => "payment.succeeded", "object" => { "id" => "pay-001", "status" => "succeeded" }) }

  it "inherits dot-notation access from Base" do
    expect(webhook.id).to eq("wh-001")
    expect(webhook.event).to eq("payment.succeeded")
  end

  it "wraps nested hashes" do
    expect(webhook.object).to be_a(Yookassa::Entities::Base)
    expect(webhook.object.id).to eq("pay-001")
  end

  it "returns hash via to_h" do
    expect(webhook.to_h).to eq(
      "id" => "wh-001",
      "event" => "payment.succeeded",
      "object" => { "id" => "pay-001", "status" => "succeeded" }
    )
  end
end
