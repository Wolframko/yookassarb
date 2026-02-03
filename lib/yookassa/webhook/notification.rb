# frozen_string_literal: true

require "json"

module Yookassa
  module Webhook
    # Parses incoming webhook notification payloads from YooKassa
    class Notification
      attr_reader :event, :type, :object

      ENTITY_MAP = {
        "payment" => Entities::Payment,
        "refund" => Entities::Refund,
        "payout" => Entities::Payout,
        "deal" => Entities::Deal
      }.freeze

      def initialize(event:, type:, object:)
        @event = event
        @type = type
        @object = object
      end

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
