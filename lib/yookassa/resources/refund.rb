# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for the +/v3/refunds+ endpoint.
    #
    # Inherits +create+, +find+, and +list+ from {Base}.
    #
    # @see https://yookassa.ru/developers/api#create_refund API reference
    class Refund < Base
      resource_path "refunds"
      entity_class Entities::Refund
    end
  end
end
