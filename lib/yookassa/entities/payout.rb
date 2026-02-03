# frozen_string_literal: true

module Yookassa
  module Entities
    # Payout entity with status helpers
    class Payout < Base
      def succeeded?
        status == "succeeded"
      end

      def canceled?
        status == "canceled"
      end
    end
  end
end
