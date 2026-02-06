# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for /v3/webhooks endpoint
    class Webhook < Base
      def create(params, idempotency_key: nil)
        data = request(:post, "webhooks", body: params, idempotency_key: idempotency_key)
        Entities::WebhookObj.new(data)
      end

      def list
        data = request(:get, "webhooks")
        Entities::Collection.new(
          items: data["items"] || [],
          entity_class: Entities::WebhookObj
        )
      end

      def delete(webhook_id)
        request(:delete, "webhooks/#{webhook_id}")
        true
      end
    end
  end
end
