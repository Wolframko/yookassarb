# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for /v3/payouts endpoint
    class Payout < Base
      resource_path "payouts"
      entity_class Entities::Payout
    end
  end
end
