# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for /v3/refunds endpoint
    class Refund < Base
      def create(params, idempotency_key: nil)
        data = request(:post, "refunds", body: params, idempotency_key: idempotency_key)
        Entities::Refund.new(data)
      end

      def find(refund_id)
        data = request(:get, "refunds/#{refund_id}")
        Entities::Refund.new(data)
      end

      def list(**filters)
        build_collection("refunds", entity_class: Entities::Refund, query: filters)
      end
    end
  end
end
