# frozen_string_literal: true

module Yookassa
  module Entities
    # Paginated collection of entities with cursor-based navigation.
    #
    # Includes +Enumerable+ so standard methods (+map+, +select+, +first+, etc.)
    # work out of the box.
    #
    # @example Iterating over payments
    #   payments = client.payments.list(limit: 10)
    #   payments.each { |p| puts p.id }
    #   payments.has_next?   # => true
    #   payments.next_cursor # => "cursor_abc"
    class Collection
      include Enumerable

      # @return [Array<Entities::Base>] wrapped entity objects
      attr_reader :items

      # @return [String, nil] cursor for fetching the next page
      attr_reader :next_cursor

      # @param items [Array<Hash>] raw item hashes from API response
      # @param next_cursor [String, nil] pagination cursor for the next page
      # @param entity_class [Class] entity class to wrap each item (default: {Entities::Base})
      def initialize(items:, next_cursor: nil, entity_class: Entities::Base)
        @items = items.map { |item| entity_class.new(item) }
        @next_cursor = next_cursor
      end

      # Yields each entity in the collection.
      #
      # @yield [entity] each wrapped entity
      # @yieldparam entity [Entities::Base]
      def each(&)
        @items.each(&)
      end

      # @return [Integer] number of items in this page
      def size
        @items.size
      end
      alias length size

      # @return [Boolean] +true+ if the collection has no items
      def empty?
        @items.empty?
      end

      # @return [Boolean] +true+ if more pages are available
      def has_next?
        !@next_cursor.to_s.empty?
      end
    end
  end
end
