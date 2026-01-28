# frozen_string_literal: true

RSpec.describe Yookassa::Middleware::ErrorHandler do
  let(:app) { double("app") }
  subject(:middleware) { described_class.new(app) }

  def env_for(status:, body: nil)
    Faraday::Env.new.tap do |e|
      e.status = status
      e.body = body
      e.response_headers = {}
    end
  end

  it "does nothing for successful responses" do
    env = env_for(status: 200)
    allow(env).to receive(:success?).and_return(true)
    expect { middleware.on_complete(env) }.not_to raise_error
  end

  {
    400 => Yookassa::BadRequestError,
    401 => Yookassa::UnauthorizedError,
    403 => Yookassa::ForbiddenError,
    404 => Yookassa::NotFoundError,
    429 => Yookassa::TooManyRequestsError,
    500 => Yookassa::InternalServerError
  }.each do |status, error_class|
    it "raises #{error_class} for HTTP #{status}" do
      body = '{"code": "test_error", "description": "Test error", "parameter": "test"}'
      env = env_for(status: status, body: body)
      allow(env).to receive(:success?).and_return(false)

      expect { middleware.on_complete(env) }.to raise_error(error_class) do |e|
        expect(e.code).to eq("test_error")
        expect(e.description).to eq("Test error")
        expect(e.parameter).to eq("test")
        expect(e.http_code).to eq(status)
      end
    end
  end

  it "raises ApiError for unknown status codes" do
    env = env_for(status: 422, body: '{"description": "Unknown error"}')
    allow(env).to receive(:success?).and_return(false)
    expect { middleware.on_complete(env) }.to raise_error(Yookassa::ApiError)
  end

  it "handles non-JSON error bodies" do
    env = env_for(status: 500, body: "Internal Server Error")
    allow(env).to receive(:success?).and_return(false)
    expect { middleware.on_complete(env) }.to raise_error(Yookassa::InternalServerError)
  end
end
