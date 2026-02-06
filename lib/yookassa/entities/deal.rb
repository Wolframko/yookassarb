# frozen_string_literal: true

module Yookassa
  module Entities
    # Deal (Safe Deal) entity with status helpers.
    #
    # @see https://yookassa.ru/developers/api#deal_object Deal object reference
    class Deal < Base
      # @return [Boolean] +true+ if the deal is currently open
      def opened?
        status == "opened"
      end

      # @return [Boolean] +true+ if the deal has been closed
      def closed?
        status == "closed"
      end
    end
  end
end
