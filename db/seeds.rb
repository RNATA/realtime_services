# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 10.times do
#   Client.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     street_address: Faker::Address.street_address,
#     city: Faker::Address.city,
#     state: Faker::Address.state,
#     zipcode: Faker::Address.zip_code,
#     phone_number: Faker::PhoneNumber.phone_number,
#     password: 'password'
#   )
# end

# SERVICE_CATEGORIES = %w{ electrical plumbing hvac miscellaneous }

# SERVICE_CATEGORIES.each do |category|
#   Service.create!(category: category)
# end

# 10.times do
#   Provider.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     street_address: Faker::Address.street_address,
#     city: Faker::Address.city,
#     state: Faker::Address.state,
#     zipcode: Faker::Address.zip_code,
#     phone_number: Faker::PhoneNumber.phone_number,
#     password: 'password'
#   )
# end

# Provider.all.each do |provider|
#   provider.update(services: Service.all.sample(rand(1..3)))
# end

# 15.times do
#   Job.create!(
#     provider_service: ProviderService.find(rand(1..ProviderService.count)),
#     client: Client.find(rand(1..Client.count))
#   )
# end

# Provider.all.each do |provider|
#   provider.update(lat: rand(32.0..33.25), long: rand(-117.5..-116.85))
# end

# ProviderService.all.each do |ps|
#   ps.update(active: rand(2) == 1)
# end

# SAMPLE_RATES = ['$80.00', '$60.00', '$70.00']

# ProviderService.all.each do |ps|
#   ps.update(base_rate: SAMPLE_RATES.sample)
# end

Provider.all.each do |p|
  p.update(company_name: Faker::Company.name)
end
