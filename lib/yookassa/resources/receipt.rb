# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for the +/v3/receipts+ endpoint.
    #
    # Inherits +create+, +find+, and +list+ from {Base}.
    #
    # @see https://yookassa.ru/developers/api#create_receipt API reference
    class Receipt < Base
      resource_path "receipts"
      entity_class Entities::Receipt
    end
  end
end
