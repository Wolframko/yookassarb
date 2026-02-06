# frozen_string_literal: true

module Yookassa
  module Entities
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
