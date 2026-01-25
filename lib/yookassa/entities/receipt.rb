# frozen_string_literal: true

module Yookassa
  module Entities
    class Receipt < Base
      def succeeded?
        status == "succeeded"
      end
    end
  end
end
