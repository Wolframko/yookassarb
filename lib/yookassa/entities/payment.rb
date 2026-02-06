# frozen_string_literal: true

module Yookassa
  module Entities
    class Payment < Base
      def confirmation_url
        return nil unless attributes["confirmation"]

        attributes.dig("confirmation", "confirmation_url")
      end

      def succeeded?
        status == "succeeded"
      end

      def pending?
        status == "pending"
      end

      def canceled?
        status == "canceled"
      end

      def waiting_for_capture?
        status == "waiting_for_capture"
      end
    end
  end
end
