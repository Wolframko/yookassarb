# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for the +/v3/payouts+ endpoint.
    #
    # Inherits +create+, +find+, and +list+ from {Base}.
    #
    # @see https://yookassa.ru/developers/api#create_payout API reference
    class Payout < Base
      resource_path "payouts"
      entity_class Entities::Payout
    end
  end
end
