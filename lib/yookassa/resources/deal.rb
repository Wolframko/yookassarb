# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for the +/v3/deals+ endpoint.
    #
    # Inherits +create+, +find+, and +list+ from {Base}.
    #
    # @see https://yookassa.ru/developers/api#create_deal API reference
    class Deal < Base
      resource_path "deals"
      entity_class Entities::Deal
    end
  end
end
