# frozen_string_literal: true

module Yookassa
  # API client that holds configuration and provides access to resource endpoints.
  #
  # You can use the global client via {Yookassa.default_client} or create
  # an isolated instance for multi-shop setups.
  #
  # @example Standalone client
  #   client = Yookassa::Client.new(shop_id: "123", api_key: "key_...")
  #   payment = client.payments.create(amount: { value: "100.00", currency: "RUB" })
  class Client
    # @return [Configuration] the client's configuration
    attr_reader :config

    # Creates a new API client.
    #
    # @param shop_id [String, nil] YooKassa shop identifier
    # @param api_key [String, nil] secret API key
    # @param auth_token [String, nil] OAuth token (alternative to shop_id/api_key)
    # @param options [Hash] additional options (:timeout, :max_retries, :retry_delay, :logger)
    def initialize(shop_id: nil, api_key: nil, auth_token: nil, **options)
      @config = Configuration.new
      @config.shop_id = shop_id
      @config.api_key = api_key
      @config.auth_token = auth_token
      @config.timeout = options[:timeout] if options.key?(:timeout)
      @config.max_retries = options[:max_retries] if options.key?(:max_retries)
      @config.retry_delay = options[:retry_delay] if options.key?(:retry_delay)
      @config.logger = options[:logger] if options.key?(:logger)
    end

    # @return [Resources::Payment] payment resource endpoint
    def payments
      @payments ||= Resources::Payment.new(self)
    end

    # @return [Resources::Refund] refund resource endpoint
    def refunds
      @refunds ||= Resources::Refund.new(self)
    end

    # @return [Resources::Receipt] receipt resource endpoint
    def receipts
      @receipts ||= Resources::Receipt.new(self)
    end

    # @return [Resources::Payout] payout resource endpoint
    def payouts
      @payouts ||= Resources::Payout.new(self)
    end

    # @return [Resources::Deal] deal resource endpoint
    def deals
      @deals ||= Resources::Deal.new(self)
    end

    # @return [Resources::Webhook] webhook resource endpoint
    def webhooks
      @webhooks ||= Resources::Webhook.new(self)
    end

    # @return [Resources::Invoice] invoice resource endpoint
    def invoices
      @invoices ||= Resources::Invoice.new(self)
    end

    # @return [Resources::Settings] shop settings resource endpoint
    def settings
      @settings ||= Resources::Settings.new(self)
    end
  end
end
