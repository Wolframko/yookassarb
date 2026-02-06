# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for /v3/deals endpoint
    class Deal < Base
      resource_path "deals"
      entity_class Entities::Deal
    end
  end
end
