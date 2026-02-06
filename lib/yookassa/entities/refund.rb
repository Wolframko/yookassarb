# frozen_string_literal: true

module Yookassa
  module Entities
    # Refund entity with status helpers.
    #
    # @see https://yookassa.ru/developers/api#refund_object Refund object reference
    class Refund < Base
      # @return [Boolean] +true+ if the refund completed successfully
      def succeeded?
        status == "succeeded"
      end

      # @return [Boolean] +true+ if the refund was canceled
      def canceled?
        status == "canceled"
      end
    end
  end
end
