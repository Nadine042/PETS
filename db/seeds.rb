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

while list.size < 15
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    location: Faker::Locations::Australia.location,
    children: rand(1..2) == 1,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    profile_url: Faker::Avatar.image
  )
  list << user
end
while list_pet.size < 15
  pet = Pet.create!(
    name: Faker::Creature::Dog.name,
    kind: ["dog", "cat", "bird", "rabbit"].sample,
    age: rand(0..8),
    details: Faker::GreekPhilosophers.quote,
    start_date: Faker::Date.between(from: '2024-09-1', to: '2024-10-1'),
    end_date: Faker::Date.between(from: '2024-11-5', to: '2024-11-7'),
    user: list.sample,
    picture_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGrwqiibW9aYEokXO71t1fcMOpGY67MGzWqw&s"
  )
  list_pet << pet
end
