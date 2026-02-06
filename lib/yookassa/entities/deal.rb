# frozen_string_literal: true

module Yookassa
  module Entities
    # Deal entity with status helpers
    class Deal < Base
      def opened?
        status == "opened"
      end

      def closed?
        status == "closed"
      end
    end
  end
end
