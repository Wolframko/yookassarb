# frozen_string_literal: true

require "faraday"
require "json"

require_relative "yookassa/version"
require_relative "yookassa/errors"
require_relative "yookassa/configuration"
require_relative "yookassa/client"

require_relative "yookassa/middleware/idempotency"
require_relative "yookassa/middleware/retry"
require_relative "yookassa/middleware/error_handler"

require_relative "yookassa/entities/base"
require_relative "yookassa/entities/payment"
require_relative "yookassa/entities/refund"
require_relative "yookassa/entities/receipt"
require_relative "yookassa/entities/payout"
require_relative "yookassa/entities/deal"
require_relative "yookassa/entities/webhook_obj"
require_relative "yookassa/entities/collection"

require_relative "yookassa/resources/base"
require_relative "yookassa/resources/payment"
require_relative "yookassa/resources/refund"
require_relative "yookassa/resources/receipt"
require_relative "yookassa/resources/payout"
require_relative "yookassa/resources/deal"
require_relative "yookassa/resources/webhook"
require_relative "yookassa/resources/invoice"
require_relative "yookassa/resources/settings"

require_relative "yookassa/webhook/event_types"
require_relative "yookassa/webhook/notification"
require_relative "yookassa/webhook/ip_checker"

# Ruby SDK for the YooKassa payment gateway API (v3).
#
# Provides a clean, idiomatic interface for payments, refunds, receipts,
# payouts, deals, webhooks, and shop settings.
#
# @example Quick start
#   Yookassa.configure do |config|
#     config.shop_id = "123456"
#     config.api_key = "live_..."
#   end
#
#   payment = Yookassa::Payment.create(
#     amount: { value: "100.00", currency: "RUB" },
#     confirmation: { type: "redirect", return_url: "https://example.com" },
#     description: "Order #42"
#   )
#   redirect_to payment.confirmation_url
#
# @see https://yookassa.ru/developers/api YooKassa API documentation
module Yookassa
  class << self
    # Yields the global {Configuration} instance for setting credentials.
    #
    # @yield [config] the configuration object
    # @yieldparam config [Configuration]
    # @return [Configuration]
    #
    # @example
    #   Yookassa.configure do |config|
    #     config.shop_id = "123456"
    #     config.api_key = "live_..."
    #   end
    def configure
      yield(configuration) if block_given?
      configuration
    end

    # Returns the global {Configuration} instance, creating one if needed.
    #
    # @return [Configuration]
    def configuration
      @configuration ||= Configuration.new
    end

    # Resets global configuration and the default client to initial state.
    #
    # @return [void]
    def reset_configuration!
      @configuration = Configuration.new
      @default_client = nil
    end

    # Returns the shared {Client} built from the global configuration.
    # Lazily initialized on first call.
    #
    # @return [Client]
    def default_client
      @default_client ||= Client.new(
        shop_id: configuration.shop_id,
        api_key: configuration.api_key,
        auth_token: configuration.auth_token,
        timeout: configuration.timeout,
        max_retries: configuration.max_retries,
        retry_delay: configuration.retry_delay,
        logger: configuration.logger
      )
    end
  end

  # Convenience wrapper for payment operations via the default client.
  #
  # @example Create a payment
  #   payment = Yookassa::Payment.create(
  #     amount: { value: "500.00", currency: "RUB" },
  #     confirmation: { type: "redirect", return_url: "https://example.com" }
  #   )
  #
  # @see Resources::Payment
  class Payment
    class << self
      # Creates a new payment.
      #
      # @param params [Hash] payment parameters (amount, confirmation, etc.)
      # @param idempotency_key [String, nil] optional idempotency key
      # @return [Entities::Payment]
      # @raise [ApiError] on API failure
      def create(params, idempotency_key: nil)
        Yookassa.default_client.payments.create(params, idempotency_key: idempotency_key)
      end

      # Retrieves a payment by ID.
      #
      # @param payment_id [String] the payment ID
      # @return [Entities::Payment]
      # @raise [NotFoundError] if payment does not exist
      def find(payment_id)
        Yookassa.default_client.payments.find(payment_id)
      end

      # Captures an authorized payment.
      #
      # @param payment_id [String] the payment ID
      # @param params [Hash] optional capture parameters (amount, etc.)
      # @param idempotency_key [String, nil] optional idempotency key
      # @return [Entities::Payment]
      # @raise [ApiError] on API failure
      def capture(payment_id, params = {}, idempotency_key: nil)
        Yookassa.default_client.payments.capture(payment_id, params, idempotency_key: idempotency_key)
      end

      # Cancels a payment.
      #
      # @param payment_id [String] the payment ID
      # @param idempotency_key [String, nil] optional idempotency key
      # @return [Entities::Payment]
      # @raise [ApiError] on API failure
      def cancel(payment_id, idempotency_key: nil)
        Yookassa.default_client.payments.cancel(payment_id, idempotency_key: idempotency_key)
      end

      # Lists payments matching the given filters.
      #
      # @param filters [Hash] query filters (status, created_at, limit, cursor, etc.)
      # @return [Entities::Collection<Entities::Payment>]
      def list(**filters)
        Yookassa.default_client.payments.list(**filters)
      end
    end
  end

  # Base class for convenience shortcuts that delegate CRUD to the default client.
  #
  # Subclasses call {.delegates_to} to specify which resource method on {Client}
  # to use for delegation.
  #
  # @abstract Subclass and call +delegates_to :resource_method+
  class ResourceShortcut
    class << self
      # Declares which {Client} method this shortcut delegates to.
      #
      # @param method [Symbol] the client resource method name
      # @return [void]
      def delegates_to(method)
        @resource_method = method
      end

      # Creates a new resource.
      #
      # @param params [Hash] resource parameters
      # @param idempotency_key [String, nil] optional idempotency key
      # @return [Entities::Base]
      # @raise [ApiError] on API failure
      def create(params, idempotency_key: nil)
        resource.create(params, idempotency_key: idempotency_key)
      end

      # Retrieves a resource by ID.
      #
      # @param resource_id [String] the resource ID
      # @return [Entities::Base]
      # @raise [NotFoundError] if resource does not exist
      def find(resource_id)
        resource.find(resource_id)
      end

      # Lists resources matching the given filters.
      #
      # @param filters [Hash] query filters
      # @return [Entities::Collection]
      def list(**filters)
        resource.list(**filters)
      end

      private

      def resource
        Yookassa.default_client.public_send(@resource_method)
      end
    end
  end

  # Convenience wrapper for refund operations via the default client.
  #
  # @see Resources::Refund
  class Refund < ResourceShortcut
    delegates_to :refunds
  end

  # Convenience wrapper for receipt operations via the default client.
  #
  # @see Resources::Receipt
  class Receipt < ResourceShortcut
    delegates_to :receipts
  end

  # Convenience wrapper for payout operations via the default client.
  #
  # @see Resources::Payout
  class Payout < ResourceShortcut
    delegates_to :payouts
  end

  # Convenience wrapper for deal operations via the default client.
  #
  # @see Resources::Deal
  class Deal < ResourceShortcut
    delegates_to :deals
  end

  # Namespace for webhook notification handling and IP validation.
  #
  # @see Webhook::Notification
  # @see Webhook::IpChecker
  module Webhook
    # Webhook::Notification and Webhook::IpChecker are loaded via require_relative above
  end
end
