# frozen_string_literal: true

module Yookassa
  module Entities
    # Refund entity with status helpers
    class Refund < Base
      def succeeded?
        status == "succeeded"
      end

      def canceled?
        status == "canceled"
      end
    end
  end
end
