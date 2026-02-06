# frozen_string_literal: true

module Yookassa
  module Middleware
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
            sleep(@retry_delay * attempt)
            env.body = env.request_body
            next
          end

          return response
        rescue Faraday::ConnectionFailed, Faraday::TimeoutError => e
          raise e if attempt >= @max_retries

          attempt += 1
          sleep(@retry_delay * attempt)
        end
      end
    end
  end
end
