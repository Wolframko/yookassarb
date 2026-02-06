# frozen_string_literal: true

require "json"
require "securerandom"

module Yookassa
  module Resources
    # Base resource class with HTTP request handling and connection setup
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
        body = response.body
        return nil if body.to_s.empty?

        JSON.parse(body)
      end

      def build_connection
        config = client.config
        creds = config.credentials

        Faraday.new(url: "https://api.yookassa.ru/v3") do |conn|
          configure_headers(conn)
          configure_auth(conn, creds)
          configure_middleware(conn, config)
          conn.adapter Faraday.default_adapter
        end
      end

      def configure_headers(conn)
        conn.request :json
        conn.headers["Content-Type"] = "application/json"
        conn.headers["User-Agent"] = "yookassa-ruby/#{Yookassa::VERSION}"
      end

      def configure_auth(conn, creds)
        auth_token = creds[:auth_token]
        if auth_token
          conn.request :authorization, "Bearer", auth_token
        else
          conn.request :authorization, :basic, creds[:shop_id].to_s, creds[:api_key].to_s
        end
      end

      def configure_middleware(conn, config)
        conn.use Yookassa::Middleware::Idempotency
        conn.use Yookassa::Middleware::Retry,
                 max_retries: config.max_retries,
                 retry_delay: config.retry_delay
        conn.use Yookassa::Middleware::ErrorHandler
        conn.options.timeout = config.timeout
      end

      def build_collection(path, entity_class:, query: {})
        data = request(:get, path, query: query)
        Entities::Collection.new(
          items: data["items"] || [],
          next_cursor: data["next_cursor"],
          entity_class: entity_class
        )
      end
    end
  end
end
