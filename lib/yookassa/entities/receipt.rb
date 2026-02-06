# frozen_string_literal: true

module Yookassa
  module Entities
    # Receipt entity with status helpers.
    #
    # @see https://yookassa.ru/developers/api#receipt_object Receipt object reference
    class Receipt < Base
      # @return [Boolean] +true+ if the receipt was delivered successfully
      def succeeded?
        status == "succeeded"
      end
    end
  end
end
