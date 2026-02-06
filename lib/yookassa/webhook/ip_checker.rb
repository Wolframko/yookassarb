# frozen_string_literal: true

require "ipaddr"

module Yookassa
  module Webhook
    # Validates webhook request source IP against YooKassa trusted networks
    module IpChecker
      TRUSTED_NETWORKS = [
        IPAddr.new("185.71.76.0/27"),
        IPAddr.new("185.71.77.0/27"),
        IPAddr.new("77.75.153.0/25"),
        IPAddr.new("77.75.156.11"),
        IPAddr.new("77.75.156.35"),
        IPAddr.new("77.75.154.128/25"),
        IPAddr.new("2a02:5180::/32")
      ].freeze

      def self.trusted?(ip)
        addr = IPAddr.new(ip.to_s)
        TRUSTED_NETWORKS.any? { |network| network.include?(addr) }
      rescue IPAddr::InvalidAddressError
        false
      end
    end
  end
end
