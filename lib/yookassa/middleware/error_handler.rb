# frozen_string_literal: true

require "json"

module Yookassa
  module Middleware
    # Faraday middleware that maps HTTP error responses to typed exceptions.
    #
    # Inspects the response status and raises the appropriate {ApiError} subclass.
    # The error body is parsed to extract YooKassa error code, description,
    # and parameter name when available.
    #
    # @see Yookassa::ApiError
    class ErrorHandler < Faraday::Middleware
      # Maps HTTP status codes to error classes.
      ERROR_MAP = {
        400 => Yookassa::BadRequestError,
        401 => Yookassa::UnauthorizedError,
        403 => Yookassa::ForbiddenError,
        404 => Yookassa::NotFoundError,
        429 => Yookassa::TooManyRequestsError,
        500 => Yookassa::InternalServerError
      }.freeze

      def on_complete(env)
        return if env.success?

        status = env.status
        body = env.body
        error_class = ERROR_MAP[status] || Yookassa::ApiError
        error_data = parse_error_body(body)

        raise error_class.new(
          code: error_data[:code],
          description: error_data[:description],
          parameter: error_data[:parameter],
          response: {
            http_code: status,
            body: body,
            headers: env.response_headers
          }
        )
      end

      private

      def parse_error_body(body)
        return {} if body.to_s.empty?

        parsed = JSON.parse(body)
        {
          code: parsed["code"],
          description: parsed["description"],
          parameter: parsed["parameter"]
        }
      rescue JSON::ParserError
        { description: body }
      end
    end
  end
end
