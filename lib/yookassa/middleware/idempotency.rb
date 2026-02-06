# frozen_string_literal: true

require "securerandom"

module Yookassa
  module Middleware
    # Faraday middleware that ensures POST and DELETE requests include an idempotency key.
    #
    # If the +Idempotence-Key+ header is not already set, a UUID v4 is generated
    # automatically. This prevents duplicate operations when requests are retried.
    class Idempotency < Faraday::Middleware
      # YooKassa idempotency header name.
      IDEMPOTENCY_HEADER = "Idempotence-Key"

      # @param app [#call] the next middleware in the Faraday stack
      # @param idempotency_key [String, nil] optional fixed key (mainly for testing)
      def initialize(app, idempotency_key: nil)
        super(app)
        @idempotency_key = idempotency_key
      end

      def on_request(env)
        return unless %i[post delete].include?(env.method)

        headers = env.request_headers
        return if headers[IDEMPOTENCY_HEADER]

        headers[IDEMPOTENCY_HEADER] = @idempotency_key || SecureRandom.uuid
      end
    end
  end
end
