# frozen_string_literal: true

module Yookassa
  module Entities
    # Receipt entity with status helpers
    class Receipt < Base
      def succeeded?
        status == "succeeded"
      end
    end
  end
end
