# frozen_string_literal: true

RSpec.describe Yookassa::Entities::Receipt do
  subject(:receipt) { described_class.new("id" => "rc-001", "status" => "succeeded", "type" => "payment") }

  it "inherits dot-notation access from Base" do
    expect(receipt.id).to eq("rc-001")
    expect(receipt.type).to eq("payment")
  end

  describe "#succeeded?" do
    it "returns true when status is succeeded" do
      expect(receipt.succeeded?).to be true
    end

    it "returns false when status is not succeeded" do
      receipt = described_class.new("status" => "pending")
      expect(receipt.succeeded?).to be false
    end
  end
end
