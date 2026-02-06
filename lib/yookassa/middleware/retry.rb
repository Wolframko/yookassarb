# frozen_string_literal: true

module Yookassa
  module Middleware
    # Faraday middleware that retries requests on transient failures.
    #
    # Retries on HTTP 202 (object not ready yet), 500 (server error),
    # and Faraday connection/timeout exceptions. Uses linear backoff
    # with configurable delay.
    class Retry < Faraday::Middleware
      # HTTP status codes that trigger a retry.
      RETRYABLE_STATUSES = [202, 500].freeze

      # @param app [#call] the next middleware in the Faraday stack
      # @param max_retries [Integer] maximum number of retry attempts (default: 3)
      # @param retry_delay [Float] base delay in seconds, multiplied by attempt number (default: 1.8)
      def initialize(app, max_retries: 3, retry_delay: 1.8)
        super(app)
        @max_retries = max_retries
        @retry_delay = retry_delay
      end

      def call(env)
        attempt = 0

        loop do
          response = @app.call(env)
          return response unless retryable_status?(response, attempt)

          attempt = prepare_retry(attempt, env)
        rescue Faraday::ConnectionFailed, Faraday::TimeoutError => e
          raise e if attempt >= @max_retries

          attempt = prepare_retry(attempt, env)
        end
      end

      private

      def retryable_status?(response, attempt)
        RETRYABLE_STATUSES.include?(response.status) && attempt < @max_retries
      end

      def prepare_retry(attempt, env)
        attempt += 1
        wait(attempt)
        env.body = env.request_body
        attempt
      end

      def wait(attempt)
        sleep(@retry_delay * attempt)
      end
    end
  end
end
