class PumpStatusAccumulateJob < ApplicationJob
  queue_as :default

  def perform(as_of_seconds=Time.now.to_i)
    last = PumpStatus.last
    time_diff = as_of_seconds - last.created_at.to_i

    reserve_rate = (last.operating_at / 10 * Rails.configuration.refill_rate) - Rails.configuration.depletion_rate
    reserve_diff = time_diff * reserve_rate

    temperature_rate = (last.operating_at - 80) * Rails.configuration.temperature_rate
    temperature_diff = time_diff * temperature_rate

    PumpStatus.create reserves: last.reserves + reserve_diff,
      temperature: [last.temperature + temperature_diff, 100].max,
      operating_at: last.operating_at
  end
end
