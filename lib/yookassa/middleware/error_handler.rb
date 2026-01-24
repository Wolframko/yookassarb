# frozen_string_literal: true

require "json"

module Yookassa
  module Middleware
    class ErrorHandler < Faraday::Middleware
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

        error_class = ERROR_MAP[env.status] || Yookassa::ApiError
        error_data = parse_error_body(env.body)

        raise error_class.new(
          error_data[:description],
          code: error_data[:code],
          description: error_data[:description],
          parameter: error_data[:parameter],
          http_code: env.status,
          response_body: env.body,
          response_headers: env.response_headers
        )
      end

      private

      def parse_error_body(body)
        return {} if body.nil? || body.empty?

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
