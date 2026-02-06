# frozen_string_literal: true

RSpec.describe Yookassa::Webhook::Notification do
  describe ".parse" do
    context "with JSON string" do
      let(:json) { fixture("webhook_payment_succeeded.json") }
      subject(:notification) { described_class.parse(json) }

      it "parses event" do
        expect(notification.event).to eq("payment.succeeded")
      end

      it "parses type" do
        expect(notification.type).to eq("notification")
      end

      it "creates correct entity type" do
        expect(notification.object).to be_a(Yookassa::Entities::Payment)
      end

      it "provides access to object fields" do
        expect(notification.object.id).to eq("2a7834f6-0001-5000-a000-1da326e5e123")
        expect(notification.object.status).to eq("succeeded")
      end
    end

    context "with Hash" do
      it "parses hash input" do
        notification = described_class.parse(
          "event" => "refund.succeeded",
          "type" => "notification",
          "object" => { "id" => "ref-1", "status" => "succeeded" }
        )
        expect(notification.object).to be_a(Yookassa::Entities::Refund)
        expect(notification.object.succeeded?).to be true
      end
    end

    context "with payout event" do
      it "creates Payout entity" do
        notification = described_class.parse(
          "event" => "payout.succeeded",
          "type" => "notification",
          "object" => { "id" => "po-1", "status" => "succeeded" }
        )
        expect(notification.object).to be_a(Yookassa::Entities::Payout)
      end
    end

    context "with deal event" do
      it "creates Deal entity" do
        notification = described_class.parse(
          "event" => "deal.closed",
          "type" => "notification",
          "object" => { "id" => "dl-1", "status" => "closed" }
        )
        expect(notification.object).to be_a(Yookassa::Entities::Deal)
      end
    end
  end
end
