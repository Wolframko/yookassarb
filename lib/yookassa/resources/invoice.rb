# frozen_string_literal: true

module Yookassa
  module Resources
    class Invoice < Base
      def create(params, idempotency_key: nil)
        data = request(:post, "invoices", body: params, idempotency_key: idempotency_key)
        Entities::Base.new(data)
      end

      def find(invoice_id)
        data = request(:get, "invoices/#{invoice_id}")
        Entities::Base.new(data)
      end
    end
  end
end
