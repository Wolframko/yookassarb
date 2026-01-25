# frozen_string_literal: true

module Yookassa
  module Resources
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
        data = request(:get, "receipts", query: filters)
        Entities::Collection.new(
          items: data["items"] || [],
          next_cursor: data["next_cursor"],
          entity_class: Entities::Receipt
        )
      end
    end
  end
end
