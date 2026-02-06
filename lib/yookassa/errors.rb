# frozen_string_literal: true

module Yookassa
  # Base error class for all YooKassa gem errors
  class Error < StandardError; end

  # API error with code, description, and HTTP details from YooKassa API
  class ApiError < Error
    attr_reader :code, :description, :parameter, :response

    def initialize(code: nil, description: nil, parameter: nil, response: {})
      @code = code
      @description = description
      @parameter = parameter
      @response = response
      super(description || "API error (HTTP #{http_code})")
    end

    def http_code
      @response[:http_code]
    end

    def response_body
      @response[:body]
    end

    def response_headers
      @response[:headers]
    end
  end

  # Raised when API returns 400 Bad Request
  class BadRequestError < ApiError; end
  # Raised when API returns 401 Unauthorized
  class UnauthorizedError < ApiError; end
  # Raised when API returns 403 Forbidden
  class ForbiddenError < ApiError; end
  # Raised when API returns 404 Not Found
  class NotFoundError < ApiError; end
  # Raised when API returns 429 Too Many Requests
  class TooManyRequestsError < ApiError; end
  # Raised when API returns 500 Internal Server Error
  class InternalServerError < ApiError; end

  # Raised when network connection fails
  class ConnectionError < Error; end
  # Raised when request times out
  class TimeoutError < ConnectionError; end
end
