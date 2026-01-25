# frozen_string_literal: true

module Yookassa
  module Resources
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
        data = request(:get, "refunds", query: filters)
        Entities::Collection.new(
          items: data["items"] || [],
          next_cursor: data["next_cursor"],
          entity_class: Entities::Refund
        )
      end
    end
  end
end
