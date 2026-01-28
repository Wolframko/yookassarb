# frozen_string_literal: true

RSpec.describe Yookassa::Middleware::Idempotency do
  let(:app) { double("app") }
  let(:env) do
    Faraday::Env.new.tap do |e|
      e.method = method
      e.request_headers = Faraday::Utils::Headers.new
    end
  end

  subject(:middleware) { described_class.new(app) }

  context "for POST requests" do
    let(:method) { :post }

    it "adds Idempotence-Key header" do
      middleware.on_request(env)
      expect(env.request_headers["Idempotence-Key"]).to match(/\A[0-9a-f-]{36}\z/)
    end

    it "does not overwrite existing header" do
      env.request_headers["Idempotence-Key"] = "my-key"
      middleware.on_request(env)
      expect(env.request_headers["Idempotence-Key"]).to eq("my-key")
    end
  end

  context "for DELETE requests" do
    let(:method) { :delete }

    it "adds Idempotence-Key header" do
      middleware.on_request(env)
      expect(env.request_headers["Idempotence-Key"]).to be_a(String)
    end
  end

  context "for GET requests" do
    let(:method) { :get }

    it "does not add Idempotence-Key header" do
      middleware.on_request(env)
      expect(env.request_headers["Idempotence-Key"]).to be_nil
    end
  end

  context "with custom idempotency_key" do
    let(:method) { :post }
    subject(:middleware) { described_class.new(app, idempotency_key: "custom-key") }

    it "uses the custom key" do
      middleware.on_request(env)
      expect(env.request_headers["Idempotence-Key"]).to eq("custom-key")
    end
  end
end
