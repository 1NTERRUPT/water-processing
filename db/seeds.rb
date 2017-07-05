# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

operator_password = ENV.fetch('OPERATOR_PASSWORD', 'operator')
operator = User.create(email: 'water.operator@utilitel.com', username: 'operator', password: operator_password)


admin_password = ENV.fetch('ADMIN_PASSWORD', 'administrator')
admin = User.create(email: 'water.admin@utilitel.com', username: 'admin', password: admin_password)
