# frozen_string_literal: true

module Yookassa
  module Entities
    # Base entity class that wraps API response hashes with dynamic attribute access.
    #
    # Attributes returned by the API are accessible as methods via +method_missing+.
    # Nested hashes are automatically wrapped into entity instances, and arrays of
    # hashes become arrays of entities.
    #
    # @example
    #   entity = Yookassa::Entities::Base.new(id: "abc", amount: { value: "100", currency: "RUB" })
    #   entity.id              # => "abc"
    #   entity.amount.value    # => "100"
    #   entity[:id]            # => "abc"
    #   entity.to_h            # => { "id" => "abc", "amount" => { "value" => "100", "currency" => "RUB" } }
    class Base
      # @return [Hash<String, Object>] normalized attribute hash (string keys)
      attr_reader :attributes

      # @param data [Hash, #to_h] raw API response data
      def initialize(data)
        @attributes = self.class.send(:normalize, data)
      end

      # Hash-style attribute access.
      #
      # @param key [String, Symbol] attribute name
      # @return [Object, nil]
      def [](key)
        @attributes[key.to_s]
      end

      # Returns the raw attribute hash.
      #
      # @return [Hash<String, Object>]
      def to_h
        @attributes
      end

      def respond_to_missing?(method_name, include_private = false)
        @attributes.key?(method_name.to_s) || super
      end

      private

      def method_missing(method_name, *args)
        key = method_name.to_s
        if @attributes.key?(key)
          wrap_value(@attributes[key])
        else
          super
        end
      end

      def wrap_value(value)
        klass = self.class
        case value
        when Hash
          klass.new(value)
        when Array
          value.map { |item| item.is_a?(Hash) ? klass.new(item) : item }
        else
          value
        end
      end

      def self.normalize(data)
        case data
        when Hash
          data.transform_keys(&:to_s)
        else
          begin
            data.to_h.transform_keys(&:to_s)
          rescue StandardError
            {}
          end
        end
      end
      private_class_method :normalize
    end
  end
end
