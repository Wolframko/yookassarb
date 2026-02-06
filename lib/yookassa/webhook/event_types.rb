# frozen_string_literal: true

module Yookassa
  module Webhook
    # Constants for YooKassa webhook event types.
    #
    # @example Subscribing to a specific event
    #   client.webhooks.create(
    #     event: Yookassa::Webhook::EventTypes::PAYMENT_SUCCEEDED,
    #     url: "https://example.com/webhooks"
    #   )
    #
    # @example Checking event type
    #   EventTypes::ALL.include?(notification.event) # => true
    module EventTypes
      PAYMENT_WAITING_FOR_CAPTURE = "payment.waiting_for_capture"
      PAYMENT_SUCCEEDED = "payment.succeeded"
      PAYMENT_CANCELED = "payment.canceled"
      REFUND_SUCCEEDED = "refund.succeeded"
      PAYOUT_SUCCEEDED = "payout.succeeded"
      PAYOUT_CANCELED = "payout.canceled"
      DEAL_CLOSED = "deal.closed"

      # All known event types.
      ALL = [
        PAYMENT_WAITING_FOR_CAPTURE,
        PAYMENT_SUCCEEDED,
        PAYMENT_CANCELED,
        REFUND_SUCCEEDED,
        PAYOUT_SUCCEEDED,
        PAYOUT_CANCELED,
        DEAL_CLOSED
      ].freeze
    end
  end
end
