# frozen_string_literal: true

RSpec.describe Yookassa::Entities::Collection do
  let(:data) { json_fixture("payment_list.json") }

  subject(:collection) do
    described_class.new(
      items: data["items"],
      next_cursor: data["next_cursor"],
      entity_class: Yookassa::Entities::Payment
    )
  end

  it "contains items" do
    expect(collection.size).to eq(2)
  end

  it "wraps items in entity class" do
    expect(collection.items.first).to be_a(Yookassa::Entities::Payment)
  end

  it "provides next_cursor" do
    expect(collection.next_cursor).to eq("37a5c87d-3984-51e8-a7f3-8de646d39ec15")
  end

  it "reports has_next?" do
    expect(collection.has_next?).to be true
  end

  it "is enumerable" do
    ids = collection.map(&:id)
    expect(ids).to eq(%w[2a7834f6-0001-5000-a000-1da326e5e001 2a7834f6-0001-5000-a000-1da326e5e002])
  end

  it "handles empty collection" do
    empty = described_class.new(items: [], entity_class: Yookassa::Entities::Payment)
    expect(empty).to be_empty
    expect(empty.has_next?).to be false
  end
end
