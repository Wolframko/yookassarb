# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for /v3/payments endpoint
    class Payment < Base
      def create(params, idempotency_key: nil)
        data = request(:post, "payments", body: params, idempotency_key: idempotency_key)
        Entities::Payment.new(data)
      end

      def find(payment_id)
        data = request(:get, "payments/#{payment_id}")
        Entities::Payment.new(data)
      end

      def capture(payment_id, params = {}, idempotency_key: nil)
        data = request(:post, "payments/#{payment_id}/capture", body: params, idempotency_key: idempotency_key)
        Entities::Payment.new(data)
      end

      def cancel(payment_id, idempotency_key: nil)
        data = request(:post, "payments/#{payment_id}/cancel", idempotency_key: idempotency_key)
        Entities::Payment.new(data)
      end

      def list(**filters)
        build_collection("payments", entity_class: Entities::Payment, query: filters)
      end
    end
  end
end
