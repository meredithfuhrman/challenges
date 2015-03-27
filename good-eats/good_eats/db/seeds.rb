# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# if Rails.env.development?
#   FactoryGirl.create(:restaurant)
#   FactoryGirl.create(:review)
# end

10.times do
    name = Faker::Company.name
    address = Faker::Address.street_address
    city = Faker::Address.city
    zipcode = Faker::Address.zip_code
    state = "MA"
    Restaurant.create!(name: name, address: address, city: city, zipcode: zipcode, state: state)
    puts "Restaurant with name: #{name} created"
end
