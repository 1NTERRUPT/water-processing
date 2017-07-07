class PumpStatus < ApplicationRecord
  def reserve_rate
    (operating_at / 10 * Rails.configuration.refill_rate) - Rails.configuration.depletion_rate
  end

  def temperature_rate
    (operating_at - 80) * Rails.configuration.temperature_rate
  end

  def warnings
    [].tap do |warnings|
      if reserve_rate.negative?
        minutes = (reserves / reserve_rate / 60).abs.to_i
        warnings << "Reserves will run out in #{minutes} minutes"
      end
      if temperature_rate.positive?
        remaining = Rails.configuration.overheat_temperature - temperature
        minutes = (remaining / temperature_rate / 60).abs.to_i
        warnings << "Pump will overheat in #{minutes} minutes"
      end

      if temperature >= Rails.configuration.overheat_temperature
        remaining = Rails.configuration.overheat_temperature - temperature
        minutes = (remaining / temperature_rate / 60).abs.to_i
        warnings << "Pump has overheated. Pump can be re-enabled in #{minutes} minutes"
      end
    end
  end
end
