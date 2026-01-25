# frozen_string_literal: true

module Yookassa
  module Resources
    class Payout < Base
      def create(params, idempotency_key: nil)
        data = request(:post, "payouts", body: params, idempotency_key: idempotency_key)
        Entities::Payout.new(data)
      end

      def find(payout_id)
        data = request(:get, "payouts/#{payout_id}")
        Entities::Payout.new(data)
      end

      def list(**filters)
        data = request(:get, "payouts", query: filters)
        Entities::Collection.new(
          items: data["items"] || [],
          next_cursor: data["next_cursor"],
          entity_class: Entities::Payout
        )
      end
    end
  end
end
