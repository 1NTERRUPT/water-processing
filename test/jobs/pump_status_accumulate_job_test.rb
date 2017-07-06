require 'test_helper'

class PumpStatusAccumulateJobTest < ActiveJob::TestCase
  test "it depletes at the depletion rate" do
    calculate_at = Time.new(2015, 06, 20)
    PumpStatus.create(reserves: 100, operating_at: 0, temperature: 100, created_at: calculate_at.ago(300))
    new_status = PumpStatusAccumulateJob.new.perform(calculate_at.to_i)

    assert_equal 70, new_status.reserves
  end

  test "it increases proportional to operating percent" do
    calculate_at = Time.new(2015, 06, 20)
    PumpStatus.create(reserves: 100, operating_at: 20, temperature: 100, created_at: calculate_at.ago(300))

    new_status = PumpStatusAccumulateJob.new.perform(calculate_at.to_i)

    assert_equal 130, new_status.reserves
  end

  test "the temperature goes up over the max operating percent" do
    calculate_at = Time.new(2015, 06, 20)
    PumpStatus.create(reserves: 100, operating_at: 100, temperature: 100, created_at: calculate_at.ago(300))

    new_status = PumpStatusAccumulateJob.new.perform(calculate_at.to_i)

    assert_equal 160, new_status.temperature
  end

  test "the temperature stops at 100" do
    calculate_at = Time.new(2015, 06, 20)
    PumpStatus.create(reserves: 100, operating_at: 0, temperature: 200, created_at: calculate_at.ago(300))

    new_status = PumpStatusAccumulateJob.new.perform(calculate_at.to_i)

    assert_equal 100, new_status.temperature
  end
end
