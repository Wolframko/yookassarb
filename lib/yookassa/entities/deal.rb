# frozen_string_literal: true

module Yookassa
  module Entities
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
