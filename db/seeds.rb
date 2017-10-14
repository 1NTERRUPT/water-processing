# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create email: 'water.operator@utilitel.com',
  username: 'operator',
  password: Rails.configuration.operator_password

PumpStatus.create reserves: 1000,
  temperature: Rails.configuration.stable_temperature,
  operating_at: 0
