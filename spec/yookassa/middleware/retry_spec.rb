# frozen_string_literal: true

RSpec.describe Yookassa::Middleware::Retry do
  let(:max_retries) { 3 }
  let(:retry_delay) { 1.8 }
  let(:responses) { [] }
  let(:app) do
    call_count = 0
    proc do |env|
      resp = responses[call_count] || responses.last
      call_count += 1
      if resp.is_a?(Class) && resp < StandardError
        raise resp
      end
      Faraday::Response.new(env.merge(status: resp[:status], body: resp[:body] || ""))
    end
  end

  subject(:middleware) { described_class.new(app, max_retries: max_retries, retry_delay: retry_delay) }

  before { allow_any_instance_of(described_class).to receive(:sleep) }

  def make_env
    Faraday::Env.new.tap do |e|
      e.method = :post
      e.url = URI("https://api.yookassa.ru/v3/payments")
      e.request_headers = Faraday::Utils::Headers.new
      e.request_body = '{"amount": {"value": "100.00"}}'
      e.body = e.request_body
    end
  end

  context "when response has HTTP 202 status" do
    it "retries up to max_retries then returns the last response" do
      responses.replace([
        { status: 202, body: "pending" },
        { status: 202, body: "pending" },
        { status: 202, body: "pending" },
        { status: 202, body: "still pending" }
      ])

      response = middleware.call(make_env)
      expect(response.status).to eq(202)
      expect(response.body).to eq("still pending")
    end

    it "returns the successful response after retries" do
      responses.replace([
        { status: 202, body: "pending" },
        { status: 202, body: "pending" },
        { status: 200, body: "success" }
      ])

      response = middleware.call(make_env)
      expect(response.status).to eq(200)
      expect(response.body).to eq("success")
    end
  end

  context "when response has HTTP 500 status" do
    it "retries up to max_retries then returns the last response" do
      responses.replace([
        { status: 500, body: "error" },
        { status: 500, body: "error" },
        { status: 500, body: "error" },
        { status: 500, body: "final error" }
      ])

      response = middleware.call(make_env)
      expect(response.status).to eq(500)
      expect(response.body).to eq("final error")
    end

    it "returns the successful response after retries" do
      responses.replace([
        { status: 500, body: "error" },
        { status: 200, body: "recovered" }
      ])

      response = middleware.call(make_env)
      expect(response.status).to eq(200)
      expect(response.body).to eq("recovered")
    end
  end

  context "when response has HTTP 200 status" do
    it "does not retry" do
      responses.replace([
        { status: 200, body: "ok" }
      ])

      response = middleware.call(make_env)
      expect(response.status).to eq(200)
      expect(response.body).to eq("ok")
    end
  end

  context "when response has HTTP 400 status" do
    it "does not retry" do
      responses.replace([
        { status: 400, body: "bad request" }
      ])

      response = middleware.call(make_env)
      expect(response.status).to eq(400)
      expect(response.body).to eq("bad request")
    end
  end

  context "when Faraday::ConnectionFailed is raised" do
    it "retries and returns the successful response" do
      responses.replace([
        Faraday::ConnectionFailed,
        Faraday::ConnectionFailed,
        { status: 200, body: "connected" }
      ])

      response = middleware.call(make_env)
      expect(response.status).to eq(200)
      expect(response.body).to eq("connected")
    end

    it "raises after max_retries exceeded" do
      responses.replace([
        Faraday::ConnectionFailed,
        Faraday::ConnectionFailed,
        Faraday::ConnectionFailed,
        Faraday::ConnectionFailed
      ])

      expect { middleware.call(make_env) }.to raise_error(Faraday::ConnectionFailed)
    end
  end

  context "when Faraday::TimeoutError is raised" do
    it "retries and returns the successful response" do
      responses.replace([
        Faraday::TimeoutError,
        { status: 200, body: "ok after timeout" }
      ])

      response = middleware.call(make_env)
      expect(response.status).to eq(200)
      expect(response.body).to eq("ok after timeout")
    end

    it "raises after max_retries exceeded" do
      responses.replace([
        Faraday::TimeoutError,
        Faraday::TimeoutError,
        Faraday::TimeoutError,
        Faraday::TimeoutError
      ])

      expect { middleware.call(make_env) }.to raise_error(Faraday::TimeoutError)
    end
  end

  context "with default configuration" do
    subject(:middleware) { described_class.new(app) }

    it "defaults to 3 max_retries" do
      responses.replace([
        { status: 500 },
        { status: 500 },
        { status: 500 },
        { status: 500, body: "final" }
      ])

      response = middleware.call(make_env)
      expect(response.status).to eq(500)
      expect(response.body).to eq("final")
    end
  end

  context "sleep backoff" do
    it "sleeps with increasing delay based on attempt number" do
      responses.replace([
        { status: 500 },
        { status: 500 },
        { status: 200, body: "ok" }
      ])

      sleep_args = []
      allow_any_instance_of(described_class).to receive(:sleep) { |_instance, duration| sleep_args << duration }

      middleware.call(make_env)

      expect(sleep_args).to eq([1.8, 3.6])
    end
  end
end
