# frozen_string_literal: true

require "json"

module Yookassa
  module Webhook
    # Parses incoming webhook notification payloads from YooKassa.
    #
    # Automatically wraps the notification object into the appropriate entity class
    # (Payment, Refund, Payout, or Deal) based on the event type.
    #
    # @example Parsing a webhook in a Rails controller
    #   notification = Yookassa::Webhook::Notification.parse(request.body.read)
    #   notification.event     # => "payment.succeeded"
    #   notification.object    # => #<Yookassa::Entities::Payment ...>
    #   notification.object.id # => "2a5b8f3c-..."
    class Notification
      # @return [String] the event type (e.g. "payment.succeeded")
      attr_reader :event

      # @return [String] the notification type (always "notification")
      attr_reader :type

      # @return [Entities::Base] the wrapped entity (Payment, Refund, Payout, or Deal)
      attr_reader :object

      # Maps event type prefixes to entity classes.
      ENTITY_MAP = {
        "payment" => Entities::Payment,
        "refund" => Entities::Refund,
        "payout" => Entities::Payout,
        "deal" => Entities::Deal
      }.freeze

      # @param event [String] the event type
      # @param type [String] the notification type
      # @param object [Entities::Base] the wrapped entity
      def initialize(event:, type:, object:)
        @event = event
        @type = type
        @object = object
      end

      # Parses a raw webhook payload (JSON string or Hash) into a {Notification}.
      #
      # @param json_or_hash [String, Hash] the raw webhook body
      # @return [Notification]
      # @raise [JSON::ParserError] if string input is not valid JSON
      def self.parse(json_or_hash)
        data = json_or_hash.is_a?(String) ? JSON.parse(json_or_hash) : json_or_hash
        event = data["event"]
        entity_type = event.to_s.split(".").first
        entity_class = ENTITY_MAP[entity_type] || Entities::Base

        new(
          event: event,
          type: data["type"],
          object: entity_class.new(data["object"] || {})
        )
      end
    end
  end
end
