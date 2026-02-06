# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for the +/v3/payments+ endpoint.
    #
    # Supports creating, finding, capturing, canceling, and listing payments.
    #
    # @see https://yookassa.ru/developers/api#create_payment API reference
    class Payment < Base
      # Creates a new payment.
      #
      # @param params [Hash] payment parameters (amount, confirmation, description, etc.)
      # @param idempotency_key [String, nil] optional idempotency key
      # @return [Entities::Payment]
      # @raise [ApiError] on API failure
      def create(params, idempotency_key: nil)
        data = request(:post, "payments", body: params, idempotency_key: idempotency_key)
        Entities::Payment.new(data)
      end

      # Retrieves a payment by ID.
      #
      # @param payment_id [String] the payment identifier
      # @return [Entities::Payment]
      # @raise [NotFoundError] if payment does not exist
      def find(payment_id)
        data = request(:get, "payments/#{payment_id}")
        Entities::Payment.new(data)
      end

      # Captures an authorized payment (for two-stage payments).
      #
      # @param payment_id [String] the payment identifier
      # @param params [Hash] optional capture parameters (amount for partial capture, etc.)
      # @param idempotency_key [String, nil] optional idempotency key
      # @return [Entities::Payment]
      # @raise [ApiError] on API failure
      def capture(payment_id, params = {}, idempotency_key: nil)
        data = request(:post, "payments/#{payment_id}/capture", body: params, idempotency_key: idempotency_key)
        Entities::Payment.new(data)
      end

      # Cancels a payment that has not yet been captured.
      #
      # @param payment_id [String] the payment identifier
      # @param idempotency_key [String, nil] optional idempotency key
      # @return [Entities::Payment]
      # @raise [ApiError] on API failure
      def cancel(payment_id, idempotency_key: nil)
        data = request(:post, "payments/#{payment_id}/cancel", idempotency_key: idempotency_key)
        Entities::Payment.new(data)
      end

      # Lists payments matching the given filters.
      #
      # @param filters [Hash] query filters (status, created_at, limit, cursor, etc.)
      # @return [Entities::Collection<Entities::Payment>]
      def list(**filters)
        build_collection("payments", entity_class: Entities::Payment, query: filters)
      end
    end
  end
end
