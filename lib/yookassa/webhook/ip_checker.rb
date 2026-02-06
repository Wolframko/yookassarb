# frozen_string_literal: true

require "ipaddr"

module Yookassa
  module Webhook
    # Validates webhook request source IPs against YooKassa's trusted networks.
    #
    # Use this in your webhook endpoint to verify that requests actually come
    # from YooKassa and not from a third party.
    #
    # @example Rails before_action
    #   before_action :verify_yookassa_ip, only: :webhook
    #
    #   def verify_yookassa_ip
    #     head :forbidden unless Yookassa::Webhook::IpChecker.trusted?(request.remote_ip)
    #   end
    #
    # @see https://yookassa.ru/developers/using-api/webhooks IP addresses
    module IpChecker
      # YooKassa's trusted IP networks (IPv4 and IPv6).
      TRUSTED_NETWORKS = [
        IPAddr.new("185.71.76.0/27"),
        IPAddr.new("185.71.77.0/27"),
        IPAddr.new("77.75.153.0/25"),
        IPAddr.new("77.75.156.11"),
        IPAddr.new("77.75.156.35"),
        IPAddr.new("77.75.154.128/25"),
        IPAddr.new("2a02:5180::/32")
      ].freeze

      # Checks whether the given IP belongs to a YooKassa trusted network.
      #
      # @param ip [String] the IP address to check
      # @return [Boolean] +true+ if the IP is trusted
      def self.trusted?(ip)
        addr = IPAddr.new(ip.to_s)
        TRUSTED_NETWORKS.any? { |network| network.include?(addr) }
      rescue IPAddr::InvalidAddressError
        false
      end
    end
  end
end
