# frozen_string_literal: true

RSpec.describe Yookassa::Webhook::EventTypes do
  it "defines payment events" do
    expect(described_class::PAYMENT_SUCCEEDED).to eq("payment.succeeded")
    expect(described_class::PAYMENT_CANCELED).to eq("payment.canceled")
    expect(described_class::PAYMENT_WAITING_FOR_CAPTURE).to eq("payment.waiting_for_capture")
  end

  it "defines refund events" do
    expect(described_class::REFUND_SUCCEEDED).to eq("refund.succeeded")
  end

  it "defines payout events" do
    expect(described_class::PAYOUT_SUCCEEDED).to eq("payout.succeeded")
    expect(described_class::PAYOUT_CANCELED).to eq("payout.canceled")
  end

  it "defines deal events" do
    expect(described_class::DEAL_CLOSED).to eq("deal.closed")
  end

  it "has ALL constant with all events" do
    expect(described_class::ALL).to contain_exactly(
      "payment.waiting_for_capture",
      "payment.succeeded",
      "payment.canceled",
      "refund.succeeded",
      "payout.succeeded",
      "payout.canceled",
      "deal.closed"
    )
  end
end
