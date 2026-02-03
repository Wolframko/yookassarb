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

# Main module for YooKassa payment gateway Ruby gem
module Yookassa
  class << self
    def configure
      yield(configuration) if block_given?
      configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def reset_configuration!
      @configuration = Configuration.new
      @default_client = nil
    end

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

  # Class-level shortcuts delegating to default_client
  # Provides convenient class methods for payment operations
  class Payment
    class << self
      def create(params, idempotency_key: nil)
        Yookassa.default_client.payments.create(params, idempotency_key: idempotency_key)
      end

      def find(payment_id)
        Yookassa.default_client.payments.find(payment_id)
      end

      def capture(payment_id, params = {}, idempotency_key: nil)
        Yookassa.default_client.payments.capture(payment_id, params, idempotency_key: idempotency_key)
      end

      def cancel(payment_id, idempotency_key: nil)
        Yookassa.default_client.payments.cancel(payment_id, idempotency_key: idempotency_key)
      end

      def list(**filters)
        Yookassa.default_client.payments.list(**filters)
      end
    end
  end

  # Provides convenient class methods for refund operations
  class Refund
    class << self
      def create(params, idempotency_key: nil)
        Yookassa.default_client.refunds.create(params, idempotency_key: idempotency_key)
      end

      def find(refund_id)
        Yookassa.default_client.refunds.find(refund_id)
      end

      def list(**filters)
        Yookassa.default_client.refunds.list(**filters)
      end
    end
  end

  # Provides convenient class methods for receipt operations
  class Receipt
    class << self
      def create(params, idempotency_key: nil)
        Yookassa.default_client.receipts.create(params, idempotency_key: idempotency_key)
      end

      def find(receipt_id)
        Yookassa.default_client.receipts.find(receipt_id)
      end

      def list(**filters)
        Yookassa.default_client.receipts.list(**filters)
      end
    end
  end

  # Provides convenient class methods for payout operations
  class Payout
    class << self
      def create(params, idempotency_key: nil)
        Yookassa.default_client.payouts.create(params, idempotency_key: idempotency_key)
      end

      def find(payout_id)
        Yookassa.default_client.payouts.find(payout_id)
      end

      def list(**filters)
        Yookassa.default_client.payouts.list(**filters)
      end
    end
  end

  # Provides convenient class methods for deal operations
  class Deal
    class << self
      def create(params, idempotency_key: nil)
        Yookassa.default_client.deals.create(params, idempotency_key: idempotency_key)
      end

      def find(deal_id)
        Yookassa.default_client.deals.find(deal_id)
      end

      def list(**filters)
        Yookassa.default_client.deals.list(**filters)
      end
    end
  end

  # Namespace for webhook notification handling and IP validation
  module Webhook
    # Webhook::Notification and Webhook::IpChecker are loaded via require_relative above
  end
end
