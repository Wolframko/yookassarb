# frozen_string_literal: true

module Yookassa
  module Entities
    # Payout entity with status helpers.
    #
    # @see https://yookassa.ru/developers/api#payout_object Payout object reference
    class Payout < Base
      # @return [Boolean] +true+ if the payout completed successfully
      def succeeded?
        status == "succeeded"
      end

      # @return [Boolean] +true+ if the payout was canceled
      def canceled?
        status == "canceled"
      end
    end
  end
end
