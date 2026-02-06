# frozen_string_literal: true

module Yookassa
  class Error < StandardError; end

  class ApiError < Error
    attr_reader :code, :description, :parameter, :http_code, :response_body, :response_headers

    def initialize(message = nil, code: nil, description: nil, parameter: nil,
                   http_code: nil, response_body: nil, response_headers: nil)
      @code = code
      @description = description
      @parameter = parameter
      @http_code = http_code
      @response_body = response_body
      @response_headers = response_headers
      super(message || description || "API error (HTTP #{http_code})")
    end
  end

  class BadRequestError < ApiError; end
  class UnauthorizedError < ApiError; end
  class ForbiddenError < ApiError; end
  class NotFoundError < ApiError; end
  class TooManyRequestsError < ApiError; end
  class InternalServerError < ApiError; end

  class ConnectionError < Error; end
  class TimeoutError < ConnectionError; end
end
