# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for /v3/deals endpoint
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
        build_collection("deals", entity_class: Entities::Deal, query: filters)
      end
    end
  end
end
