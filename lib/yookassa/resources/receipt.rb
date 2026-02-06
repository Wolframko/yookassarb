# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for /v3/receipts endpoint
    class Receipt < Base
      def create(params, idempotency_key: nil)
        data = request(:post, "receipts", body: params, idempotency_key: idempotency_key)
        Entities::Receipt.new(data)
      end

      def find(receipt_id)
        data = request(:get, "receipts/#{receipt_id}")
        Entities::Receipt.new(data)
      end

      def list(**filters)
        build_collection("receipts", entity_class: Entities::Receipt, query: filters)
      end
    end
  end
end
