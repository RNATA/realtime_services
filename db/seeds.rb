# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  Client.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip_code,
    phone_number: Faker::PhoneNumber.phone_number,
    password: 'password'
  )
end

SERVICE_CATEGORIES = %w{ electrical plumbing hvac miscellaneous }

SERVICE_CATEGORIES.each do |category|
  Service.create!(category: category)
end

10.times do
  Provider.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip_code,
    phone_number: Faker::PhoneNumber.phone_number,
    password: 'password'
  )
end

Provider.all.each do |provider|
  provider.update(services: Service.all.sample(rand(1..3)))
end

15.times do
  Job.create!(
    provider_service: ProviderService.find(rand(1..ProviderService.count)),
    client: Client.find(rand(1..Client.count))
  )
end

