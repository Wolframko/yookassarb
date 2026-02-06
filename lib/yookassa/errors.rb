# frozen_string_literal: true

module Yookassa
  # Base error class for all YooKassa gem errors.
  class Error < StandardError; end

  # Error returned by the YooKassa API with structured details.
  #
  # @example Handling an API error
  #   begin
  #     Yookassa::Payment.find("nonexistent")
  #   rescue Yookassa::ApiError => e
  #     puts e.code          # => "not_found"
  #     puts e.http_code     # => 404
  #     puts e.description   # => "Payment not found"
  #   end
  class ApiError < Error
    # @return [String, nil] YooKassa error code (e.g. "invalid_request", "not_found")
    attr_reader :code

    # @return [String, nil] human-readable error description
    attr_reader :description

    # @return [String, nil] name of the invalid parameter, if applicable
    attr_reader :parameter

    # @return [Hash] raw response details (:http_code, :body, :headers)
    attr_reader :response

    # @param code [String, nil] YooKassa error code
    # @param description [String, nil] error description
    # @param parameter [String, nil] invalid parameter name
    # @param response [Hash] raw HTTP response info
    def initialize(code: nil, description: nil, parameter: nil, response: {})
      @code = code
      @description = description
      @parameter = parameter
      @response = response
      super(description || "API error (HTTP #{http_code})")
    end

    # @return [Integer, nil] HTTP status code
    def http_code
      @response[:http_code]
    end

    # @return [String, nil] raw response body
    def response_body
      @response[:body]
    end

    # @return [Hash, nil] response headers
    def response_headers
      @response[:headers]
    end
  end

  # Raised when API returns 400 Bad Request.
  class BadRequestError < ApiError; end

  # Raised when API returns 401 Unauthorized.
  class UnauthorizedError < ApiError; end

  # Raised when API returns 403 Forbidden.
  class ForbiddenError < ApiError; end

  # Raised when API returns 404 Not Found.
  class NotFoundError < ApiError; end

  # Raised when API returns 429 Too Many Requests.
  class TooManyRequestsError < ApiError; end

  # Raised when API returns 500 Internal Server Error.
  class InternalServerError < ApiError; end

  # Raised when network connection fails.
  class ConnectionError < Error; end

  # Raised when request times out.
  class TimeoutError < ConnectionError; end
end
