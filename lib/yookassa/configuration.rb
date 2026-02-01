# frozen_string_literal: true

module Yookassa
  class Configuration
    attr_accessor :shop_id, :api_key, :auth_token,
                  :timeout, :max_retries, :retry_delay,
                  :logger

    def initialize
      @timeout = 30
      @max_retries = 3
      @retry_delay = 1.8
      @logger = nil
    end

    def validate!
      return unless auth_token.nil? || auth_token.to_s.empty?
      raise Yookassa::Error, "shop_id is required (or provide auth_token)" if shop_id.nil? || shop_id.to_s.empty?
      return unless api_key.nil? || api_key.to_s.empty?

      raise Yookassa::Error, "api_key is required (or provide auth_token)"
    end

    def credentials
      if auth_token && !auth_token.to_s.empty?
        { auth_token: auth_token }
      else
        { shop_id: shop_id, api_key: api_key }
      end
    end
  end
end
