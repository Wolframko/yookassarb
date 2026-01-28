# frozen_string_literal: true

RSpec.describe Yookassa::Entities::Payout do
  subject(:payout) { described_class.new("id" => "po-001", "status" => "succeeded", "amount" => { "value" => "200.00", "currency" => "RUB" }) }

  it "inherits dot-notation access from Base" do
    expect(payout.id).to eq("po-001")
    expect(payout.amount.value).to eq("200.00")
  end

  describe "#succeeded?" do
    it "returns true when status is succeeded" do
      expect(payout.succeeded?).to be true
    end

    it "returns false when status is not succeeded" do
      payout = described_class.new("status" => "canceled")
      expect(payout.succeeded?).to be false
    end
  end

  describe "#canceled?" do
    it "returns true when status is canceled" do
      payout = described_class.new("status" => "canceled")
      expect(payout.canceled?).to be true
    end

    it "returns false when status is not canceled" do
      expect(payout.canceled?).to be false
    end
  end
end
