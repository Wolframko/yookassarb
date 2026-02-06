# frozen_string_literal: true

require "json"
require "securerandom"

module Yookassa
  module Resources
    # Base resource class with HTTP request handling and Faraday connection setup.
    #
    # Subclasses declare +resource_path+ and +entity_class+ to inherit default
    # +create+, +find+, and +list+ behaviour. Resources that need custom logic
    # (e.g. {Payment}) override those methods directly.
    #
    # @abstract Subclass and declare +resource_path+ / +entity_class+
    class Base
      # @return [Client] the API client this resource belongs to
      attr_reader :client

      # @param client [Client] the API client instance
      def initialize(client)
        @client = client
      end

      # Declares or retrieves the API path for this resource.
      #
      # @param path [String, nil] the API path (e.g. "payments") when setting
      # @return [String, nil] the configured path
      def self.resource_path(path = nil)
        if path
          @resource_path = path
        else
          @resource_path
        end
      end

      # Declares or retrieves the entity class for wrapping API responses.
      #
      # @param klass [Class, nil] the entity class when setting
      # @return [Class, nil] the configured entity class
      def self.entity_class(klass = nil)
        if klass
          @entity_class = klass
        else
          @entity_class
        end
      end

      # Creates a new resource via POST.
      #
      # @param params [Hash] resource attributes
      # @param idempotency_key [String, nil] optional idempotency key
      # @return [Entities::Base] the created entity
      # @raise [ApiError] on API failure
      def create(params, idempotency_key: nil)
        data = request(:post, resource_path, body: params, idempotency_key: idempotency_key)
        entity_class.new(data)
      end

      # Retrieves a single resource by ID via GET.
      #
      # @param resource_id [String] the resource identifier
      # @return [Entities::Base] the found entity
      # @raise [NotFoundError] if resource does not exist
      def find(resource_id)
        data = request(:get, "#{resource_path}/#{resource_id}")
        entity_class.new(data)
      end

      # Lists resources matching the given filters via GET.
      #
      # @param filters [Hash] query parameters (limit, cursor, status, etc.)
      # @return [Entities::Collection] paginated collection of entities
      def list(**filters)
        build_collection(resource_path, entity_class: entity_class, query: filters)
      end

      private

      def resource_path
        self.class.resource_path
      end

      def entity_class
        self.class.entity_class
      end

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
        Faraday.new(url: "https://api.yookassa.ru/v3") do |conn|
          configure_headers(conn)
          configure_auth(conn)
          configure_middleware(conn)
          conn.adapter Faraday.default_adapter
        end
      end

      def configure_headers(conn)
        conn.request :json
        headers = conn.headers
        headers["Content-Type"] = "application/json"
        headers["User-Agent"] = "yookassarb/#{Yookassa::VERSION}"
      end

      def configure_auth(conn)
        creds = client.config.credentials
        auth_token = creds[:auth_token]
        if auth_token
          conn.request :authorization, "Bearer", auth_token
        else
          conn.request :authorization, :basic, creds[:shop_id].to_s, creds[:api_key].to_s
        end
      end

      def configure_middleware(conn)
        config = client.config
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
