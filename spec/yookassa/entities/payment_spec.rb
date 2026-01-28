# frozen_string_literal: true

RSpec.describe Yookassa::Entities::Payment do
  let(:data) { json_fixture("payment.json") }
  subject(:payment) { described_class.new(data) }

  it "has an id" do
    expect(payment.id).to eq("2a7834f6-0001-5000-a000-1da326e5e123")
  end

  it "has a status" do
    expect(payment.status).to eq("pending")
  end

  it "provides amount" do
    expect(payment.amount.value).to eq("100.00")
    expect(payment.amount.currency).to eq("RUB")
  end

  describe "#confirmation_url" do
    it "returns the confirmation URL" do
      expect(payment.confirmation_url).to eq("https://yoomoney.ru/checkout/payments/v2/contract?orderId=123")
    end

    it "returns nil when no confirmation" do
      payment = described_class.new("id" => "1", "status" => "pending")
      expect(payment.confirmation_url).to be_nil
    end
  end

  describe "status predicates" do
    it "#pending?" do
      expect(payment.pending?).to be true
      expect(payment.succeeded?).to be false
    end

    it "#succeeded?" do
      succeeded = described_class.new(json_fixture("payment_succeeded.json"))
      expect(succeeded.succeeded?).to be true
      expect(succeeded.pending?).to be false
    end

    it "#canceled?" do
      canceled = described_class.new("status" => "canceled")
      expect(canceled.canceled?).to be true
    end

    it "#waiting_for_capture?" do
      wfc = described_class.new("status" => "waiting_for_capture")
      expect(wfc.waiting_for_capture?).to be true
    end
  end
end
