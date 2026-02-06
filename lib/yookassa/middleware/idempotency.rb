# frozen_string_literal: true

require "securerandom"

module Yookassa
  module Middleware
    # Faraday middleware that adds idempotency key to POST and DELETE requests
    class Idempotency < Faraday::Middleware
      IDEMPOTENCY_HEADER = "Idempotence-Key"

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
