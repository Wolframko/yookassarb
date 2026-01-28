# frozen_string_literal: true

RSpec.describe Yookassa::Entities::Base do
  subject(:entity) { described_class.new("id" => "123", "name" => "test", "nested" => { "key" => "val" }) }

  it "provides dot-notation access" do
    expect(entity.id).to eq("123")
    expect(entity.name).to eq("test")
  end

  it "provides bracket access" do
    expect(entity["id"]).to eq("123")
    expect(entity[:id]).to eq("123")
  end

  it "wraps nested hashes" do
    expect(entity.nested).to be_a(described_class)
    expect(entity.nested.key).to eq("val")
  end

  it "returns hash via to_h" do
    expect(entity.to_h).to eq("id" => "123", "name" => "test", "nested" => { "key" => "val" })
  end

  it "responds to existing attributes" do
    expect(entity).to respond_to(:id)
    expect(entity).not_to respond_to(:nonexistent)
  end

  it "raises NoMethodError for missing attributes" do
    expect { entity.nonexistent }.to raise_error(NoMethodError)
  end

  it "handles symbol keys" do
    entity = described_class.new(id: "sym", status: "ok")
    expect(entity.id).to eq("sym")
  end
end
