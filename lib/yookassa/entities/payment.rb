# frozen_string_literal: true

module Yookassa
  module Entities
    # Payment entity with status helpers and confirmation URL access.
    #
    # All attributes from the API response (id, status, amount, description, etc.)
    # are accessible as methods via the inherited {Base} dynamic dispatch.
    #
    # @see https://yookassa.ru/developers/api#payment_object Payment object reference
    class Payment < Base
      # Returns the confirmation URL for redirect-based payment flows.
      #
      # @return [String, nil] the URL to redirect the user to, or +nil+ if not available
      def confirmation_url
        return nil unless attributes["confirmation"]

        attributes.dig("confirmation", "confirmation_url")
      end

      # @return [Boolean] +true+ if the payment completed successfully
      def succeeded?
        status == "succeeded"
      end

      # @return [Boolean] +true+ if the payment is awaiting user action
      def pending?
        status == "pending"
      end

      # @return [Boolean] +true+ if the payment was canceled
      def canceled?
        status == "canceled"
      end

      # @return [Boolean] +true+ if the payment is authorized and awaiting capture
      def waiting_for_capture?
        status == "waiting_for_capture"
      end
    end
  end
end
