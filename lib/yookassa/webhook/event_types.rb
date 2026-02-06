# frozen_string_literal: true

module Yookassa
  module Webhook
    module EventTypes
      PAYMENT_WAITING_FOR_CAPTURE = "payment.waiting_for_capture"
      PAYMENT_SUCCEEDED = "payment.succeeded"
      PAYMENT_CANCELED = "payment.canceled"
      REFUND_SUCCEEDED = "refund.succeeded"
      PAYOUT_SUCCEEDED = "payout.succeeded"
      PAYOUT_CANCELED = "payout.canceled"
      DEAL_CLOSED = "deal.closed"

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
