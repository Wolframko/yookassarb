# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for /v3/payouts endpoint
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
        build_collection("payouts", entity_class: Entities::Payout, query: filters)
      end
    end
  end
end
