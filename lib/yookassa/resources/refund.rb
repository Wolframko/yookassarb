# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for /v3/refunds endpoint
    class Refund < Base
      resource_path "refunds"
      entity_class Entities::Refund
    end
  end
end
