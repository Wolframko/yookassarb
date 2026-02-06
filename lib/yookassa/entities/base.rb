# frozen_string_literal: true

module Yookassa
  module Entities
    class Base
      attr_reader :attributes

      def initialize(data)
        @attributes = normalize(data)
      end

      def [](key)
        @attributes[key.to_s]
      end

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
        case value
        when Hash
          self.class.new(value)
        when Array
          value.map { |v| v.is_a?(Hash) ? self.class.new(v) : v }
        else
          value
        end
      end

      def normalize(data)
        case data
        when Hash
          data.transform_keys(&:to_s)
        else
          data.to_h.transform_keys(&:to_s) rescue {}
        end
      end
    end
  end
end
