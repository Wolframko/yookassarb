# frozen_string_literal: true

RSpec.describe Yookassa::Entities::Deal do
  subject(:deal) { described_class.new("id" => "dl-001", "status" => "opened", "type" => "safe_deal") }

  it "inherits dot-notation access from Base" do
    expect(deal.id).to eq("dl-001")
    expect(deal.type).to eq("safe_deal")
  end

  describe "#opened?" do
    it "returns true when status is opened" do
      expect(deal.opened?).to be true
    end

    it "returns false when status is not opened" do
      deal = described_class.new("status" => "closed")
      expect(deal.opened?).to be false
    end
  end

  describe "#closed?" do
    it "returns true when status is closed" do
      deal = described_class.new("status" => "closed")
      expect(deal.closed?).to be true
    end

    it "returns false when status is not closed" do
      expect(deal.closed?).to be false
    end
  end
end
