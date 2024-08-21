# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
list = []
list_pet = []
Booking.destroy_all
Pet.destroy_all
User.destroy_all

while list.size < 3
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    location: Faker::Locations::Australia.location,
    children: rand(1..2) == 1,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )
  list << user
end
while list_pet.size < 2
  p list
  pet = Pet.create!(
    name: Faker::Creature::Dog.name,
    kind: Faker::Creature::Animal.name,
    age: rand(0..8),
    details: Faker::GreekPhilosophers.quote,
    user: list.sample
  )
  list_pet << pet
end

Booking.create!(
  user: list.sample,
  pet: list_pet.sample,
  start_date: Faker::Date.between(from: '2024-09-1', to: '2024-10-1'),
  end_date: Faker::Date.between(from: '2024-11-5', to: '2024-11-7'),
  status: "pending"
)
