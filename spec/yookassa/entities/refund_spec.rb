# frozen_string_literal: true

RSpec.describe Yookassa::Entities::Refund do
  subject(:refund) { described_class.new("id" => "rf-001", "status" => "succeeded", "amount" => { "value" => "50.00", "currency" => "RUB" }) }

  it "inherits dot-notation access from Base" do
    expect(refund.id).to eq("rf-001")
    expect(refund.amount.value).to eq("50.00")
  end

  describe "#succeeded?" do
    it "returns true when status is succeeded" do
      expect(refund.succeeded?).to be true
    end

    it "returns false when status is not succeeded" do
      refund = described_class.new("status" => "canceled")
      expect(refund.succeeded?).to be false
    end
  end

  describe "#canceled?" do
    it "returns true when status is canceled" do
      refund = described_class.new("status" => "canceled")
      expect(refund.canceled?).to be true
    end

    it "returns false when status is not canceled" do
      expect(refund.canceled?).to be false
    end
  end
end
