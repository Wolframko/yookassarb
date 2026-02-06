# frozen_string_literal: true

module Yookassa
  module Resources
    # REST resource for the +/v3/invoices+ endpoint.
    #
    # @see https://yookassa.ru/developers/api YooKassa API reference
    class Invoice < Base
      # Creates a new invoice.
      #
      # @param params [Hash] invoice parameters
      # @param idempotency_key [String, nil] optional idempotency key
      # @return [Entities::Base]
      # @raise [ApiError] on API failure
      def create(params, idempotency_key: nil)
        data = request(:post, "invoices", body: params, idempotency_key: idempotency_key)
        Entities::Base.new(data)
      end

      # Retrieves an invoice by ID.
      #
      # @param invoice_id [String] the invoice identifier
      # @return [Entities::Base]
      # @raise [NotFoundError] if invoice does not exist
      def find(invoice_id)
        data = request(:get, "invoices/#{invoice_id}")
        Entities::Base.new(data)
      end
    end
  end
end
