# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for /v3/me endpoint
    class Settings < Base
      def retrieve
        data = request(:get, "me")
        Entities::Base.new(data)
      end
    end
  end
end
