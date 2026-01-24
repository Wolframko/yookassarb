# frozen_string_literal: true

module Yookassa
  class Client
    attr_reader :config

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

    def payments
      @payments ||= Resources::Payment.new(self)
    end

    def refunds
      @refunds ||= Resources::Refund.new(self)
    end

    def receipts
      @receipts ||= Resources::Receipt.new(self)
    end

    def payouts
      @payouts ||= Resources::Payout.new(self)
    end

    def deals
      @deals ||= Resources::Deal.new(self)
    end

    def webhooks
      @webhooks ||= Resources::Webhook.new(self)
    end

    def invoices
      @invoices ||= Resources::Invoice.new(self)
    end

    def settings
      @settings ||= Resources::Settings.new(self)
    end
  end
end
