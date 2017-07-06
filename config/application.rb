require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WaterProcessing
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.operator_password = ENV.fetch('OPERATOR_PASSWORD', 'operator')

    config.max_operating_percent = ENV.fetch('MAX_OPERATING_PERCENT',80)
    config.stable_temperature = ENV.fetch('STABLE_TEMPERATURE', 100)
    config.depletion_rate = ENV.fetch('DEPLETION_RATE', 0.1)
    config.refill_rate = ENV.fetch('REFILL_RATE', 0.1)
    config.temperature_rate = ENV.fetch('TEMPERATURE_RATE', 0.01)
  end
end
