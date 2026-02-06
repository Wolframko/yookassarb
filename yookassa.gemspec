# frozen_string_literal: true

require_relative "lib/yookassa/version"

Gem::Specification.new do |spec|
  spec.name = "yookassa"
  spec.version = Yookassa::VERSION
  spec.authors = ["Wolfram"]
  spec.summary = "Ruby SDK for YooKassa payment API"
  spec.description = "Convenient Ruby wrapper around YooKassa API v3. " \
                     "Supports payments, refunds, receipts, payouts, deals, webhooks, and more."
  spec.homepage = "https://github.com/wolfram/yookassa-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"

  spec.files = Dir["lib/**/*.rb", "LICENSE", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0.1", "< 3.0"

  spec.metadata["rubygems_mfa_required"] = "true"
end
