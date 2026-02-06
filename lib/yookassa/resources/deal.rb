# frozen_string_literal: true

module Yookassa
  module Resources
    class Deal < Base
      def create(params, idempotency_key: nil)
        data = request(:post, "deals", body: params, idempotency_key: idempotency_key)
        Entities::Deal.new(data)
      end

      def find(deal_id)
        data = request(:get, "deals/#{deal_id}")
        Entities::Deal.new(data)
      end

      def list(**filters)
        data = request(:get, "deals", query: filters)
        Entities::Collection.new(
          items: data["items"] || [],
          next_cursor: data["next_cursor"],
          entity_class: Entities::Deal
        )
      end
    end
  end
end
