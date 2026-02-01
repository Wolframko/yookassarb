# frozen_string_literal: true

require "json"
require "securerandom"

module Yookassa
  module Resources
    class Base
      attr_reader :client

      def initialize(client)
        @client = client
      end

      private

      def connection
        @connection ||= build_connection
      end

      def request(method, path, body: nil, query: nil, idempotency_key: nil)
        response = connection.public_send(method) do |req|
          req.url path
          req.params = query if query
          req.body = JSON.generate(body) if body
          req.headers["Idempotence-Key"] = idempotency_key if idempotency_key && %i[post delete].include?(method)
        end

        parse_response(response)
      end

      def parse_response(response)
        return nil if response.body.nil? || response.body.empty?

        JSON.parse(response.body)
      end

      def build_connection
        config = client.config

        Faraday.new(url: "https://api.yookassa.ru/v3") do |conn|
          conn.request :json
          conn.headers["Content-Type"] = "application/json"
          conn.headers["User-Agent"] = "yookassa-ruby/#{Yookassa::VERSION}"

          creds = config.credentials
          if creds[:auth_token]
            conn.request :authorization, "Bearer", creds[:auth_token]
          else
            conn.request :authorization, :basic, creds[:shop_id].to_s, creds[:api_key].to_s
          end

          conn.use Yookassa::Middleware::Idempotency
          conn.use Yookassa::Middleware::Retry,
                   max_retries: config.max_retries,
                   retry_delay: config.retry_delay
          conn.use Yookassa::Middleware::ErrorHandler

          conn.options.timeout = config.timeout

          conn.adapter Faraday.default_adapter
        end
      end
    end
  end
end
