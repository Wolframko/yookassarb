# frozen_string_literal: true

module Yookassa
  module Middleware
    # Faraday middleware that retries on 202/500 status codes and connection failures
    class Retry < Faraday::Middleware
      RETRYABLE_STATUSES = [202, 500].freeze

      def initialize(app, max_retries: 3, retry_delay: 1.8)
        super(app)
        @max_retries = max_retries
        @retry_delay = retry_delay
      end

      def call(env)
        attempt = 0

        loop do
          response = @app.call(env)

          if RETRYABLE_STATUSES.include?(response.status) && attempt < @max_retries
            attempt += 1
            wait(attempt)
            env.body = env.request_body
            next
          end

          return response
        rescue Faraday::ConnectionFailed, Faraday::TimeoutError => error
          raise error if attempt >= @max_retries

          attempt += 1
          wait(attempt)
        end
      end

      private

      def wait(attempt)
        sleep(@retry_delay * attempt)
      end
    end
  end
end
