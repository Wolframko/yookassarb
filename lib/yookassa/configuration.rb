# frozen_string_literal: true

module Yookassa
  # Holds API credentials and connection settings for the YooKassa API.
  #
  # @example Using shop_id + api_key
  #   Yookassa.configure do |config|
  #     config.shop_id = "123456"
  #     config.api_key = "live_..."
  #   end
  #
  # @example Using OAuth token
  #   Yookassa.configure do |config|
  #     config.auth_token = "oauth_token_..."
  #   end
  class Configuration
    # @return [String, nil] YooKassa shop (merchant) identifier
    attr_accessor :shop_id

    # @return [String, nil] secret API key for Basic auth
    attr_accessor :api_key

    # @return [String, nil] OAuth token (used instead of shop_id/api_key when set)
    attr_accessor :auth_token

    # @return [Integer] HTTP request timeout in seconds (default: 30)
    attr_accessor :timeout

    # @return [Integer] maximum number of retries on failure (default: 3)
    attr_accessor :max_retries

    # @return [Float] base delay between retries in seconds (default: 1.8)
    attr_accessor :retry_delay

    # @return [Logger, nil] optional logger for request/response debugging
    attr_accessor :logger

    def initialize
      @timeout = 30
      @max_retries = 3
      @retry_delay = 1.8
      @logger = nil
    end

    # Checks whether credentials are present (non-raising).
    #
    # @return [Boolean] +true+ if auth_token is set, or both shop_id and api_key are set
    def validate
      return true unless auth_token.to_s.empty?
      return false if shop_id.to_s.empty?
      return false if api_key.to_s.empty?

      true
    end

    # Validates that credentials are present, raising on failure.
    #
    # @raise [Yookassa::Error] if required credentials are missing
    # @return [void]
    def validate!
      return unless auth_token.to_s.empty?
      raise Yookassa::Error, "shop_id is required (or provide auth_token)" if shop_id.to_s.empty?
      raise Yookassa::Error, "api_key is required (or provide auth_token)" if api_key.to_s.empty?
    end

    # Returns the active credential set for HTTP authentication.
    #
    # @return [Hash] either +{ auth_token: ... }+ or +{ shop_id: ..., api_key: ... }+
    def credentials
      if auth_token && !auth_token.to_s.empty?
        { auth_token: auth_token }
      else
        { shop_id: shop_id, api_key: api_key }
      end
    end
  end
end
