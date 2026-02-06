# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for the +/v3/webhooks+ endpoint.
    #
    # Unlike other resources, webhooks support +create+, +list+, and +delete+
    # but not +find+ (individual lookup is not available in the API).
    #
    # @see https://yookassa.ru/developers/api#create_webhook API reference
    class Webhook < Base
      # Registers a new webhook subscription.
      #
      # @param params [Hash] webhook parameters (event, url)
      # @param idempotency_key [String, nil] optional idempotency key
      # @return [Entities::WebhookObj]
      # @raise [ApiError] on API failure
      def create(params, idempotency_key: nil)
        data = request(:post, "webhooks", body: params, idempotency_key: idempotency_key)
        Entities::WebhookObj.new(data)
      end

      # Lists all registered webhook subscriptions.
      #
      # @return [Entities::Collection<Entities::WebhookObj>]
      def list
        data = request(:get, "webhooks")
        Entities::Collection.new(
          items: data["items"] || [],
          entity_class: Entities::WebhookObj
        )
      end

      # Deletes a webhook subscription.
      #
      # @param webhook_id [String] the webhook identifier
      # @return [true] always returns +true+ on success
      # @raise [NotFoundError] if webhook does not exist
      def delete(webhook_id)
        request(:delete, "webhooks/#{webhook_id}")
        true
      end
    end
  end
end
