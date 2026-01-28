# frozen_string_literal: true

RSpec.describe Yookassa::Webhook::IpChecker do
  describe ".trusted?" do
    %w[
      185.71.76.1
      185.71.76.30
      185.71.77.0
      185.71.77.31
      77.75.153.0
      77.75.153.126
      77.75.156.11
      77.75.156.35
      77.75.154.128
      77.75.154.255
    ].each do |ip|
      it "trusts #{ip}" do
        expect(described_class.trusted?(ip)).to be true
      end
    end

    %w[
      8.8.8.8
      192.168.1.1
      10.0.0.1
      185.71.76.32
      77.75.153.128
      77.75.156.12
    ].each do |ip|
      it "does not trust #{ip}" do
        expect(described_class.trusted?(ip)).to be false
      end
    end

    it "trusts IPv6 from YooKassa range" do
      expect(described_class.trusted?("2a02:5180::1")).to be true
    end

    it "does not trust unknown IPv6" do
      expect(described_class.trusted?("2001:db8::1")).to be false
    end

    it "returns false for invalid IPs" do
      expect(described_class.trusted?("not-an-ip")).to be false
    end
  end
end
