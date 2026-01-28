# frozen_string_literal: true

require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
  add_filter "/generated/"
end

require "yookassa"
require "webmock/rspec"

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before do
    Yookassa.reset_configuration!
  end
end

def fixture_path(name)
  File.join(File.dirname(__FILE__), "fixtures", name)
end

def fixture(name)
  File.read(fixture_path(name))
end

def json_fixture(name)
  JSON.parse(fixture(name))
end
