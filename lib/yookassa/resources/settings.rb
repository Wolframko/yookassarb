# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for the +/v3/me+ endpoint (shop settings).
    #
    # @see https://yookassa.ru/developers/api#me_object API reference
    class Settings < Base
      # Retrieves the current shop settings and account info.
      #
      # @return [Entities::Base] shop settings entity
      # @raise [ApiError] on API failure
      def retrieve
        data = request(:get, "me")
        Entities::Base.new(data)
      end
    end
  end
end
