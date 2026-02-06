# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for /v3/receipts endpoint
    class Receipt < Base
      resource_path "receipts"
      entity_class Entities::Receipt
    end
  end
end
