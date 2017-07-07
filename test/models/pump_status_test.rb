require 'test_helper'

class PumpStatusTest < ActiveSupport::TestCase
  test "it has no warnings if everything is fine" do
    status = PumpStatus.new operating_at: 80, reserves: 1000, temperature: 100
    assert_empty status.warnings
  end

  test "it warns if the reserves will run out" do
    status = PumpStatus.new operating_at: 0, reserves: 1000, temperature: 100
    assert_includes status.warnings, "Reserves will run out in 166 minutes"
  end

  test "it warns if you're going to overheat" do
    status = PumpStatus.new operating_at: 100, reserves: 1000, temperature: 100

    assert_includes status.warnings, "Pump will overheat in 75 minutes"
  end

  test "it warns if overheated" do
    status = PumpStatus.new operating_at: 0, reserves: 1000, temperature: 1200
    assert_includes status.warnings, "Pump has overheated. Pump can be re-enabled in 4 minutes"
  end
end
