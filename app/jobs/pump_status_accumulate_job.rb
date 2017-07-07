class PumpStatusAccumulateJob < ApplicationJob
  queue_as :default

  def perform(as_of_seconds=Time.now.to_i)
    last = PumpStatus.last
    time_diff = as_of_seconds - last.created_at.to_i

    reserve_diff = time_diff * last.reserve_rate
    temperature_diff = time_diff * last.temperature_rate

    operating_at = if last.temperature >= Rails.configuration.overheat_temperature
                     0
                   else
                     last.operating_at
                   end

    PumpStatus.create reserves: last.reserves + reserve_diff,
      temperature: [last.temperature + temperature_diff, 100].max,
      operating_at: operating_at
  end
end
