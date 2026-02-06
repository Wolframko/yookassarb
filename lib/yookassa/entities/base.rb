# frozen_string_literal: true

module Yookassa
  module Entities
    # Base entity class with dynamic attribute access via method_missing
    class Base
      attr_reader :attributes

      def initialize(data)
        @attributes = self.class.send(:normalize, data)
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
