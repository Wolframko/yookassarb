# frozen_string_literal: true

module Yookassa
  module Entities
    class Collection
      include Enumerable

      attr_reader :items, :next_cursor

      def initialize(items:, next_cursor: nil, entity_class: Entities::Base)
        @items = items.map { |item| entity_class.new(item) }
        @next_cursor = next_cursor
      end

      def each(&)
        @items.each(&)
      end

      def size
        @items.size
      end
      alias length size

      def empty?
        @items.empty?
      end

      def has_next?
        !@next_cursor.nil? && !@next_cursor.empty?
      end
    end
  end
end
