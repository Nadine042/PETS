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

Pet.destroy_all


while list.size < 5
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    location: Faker::Locations::Australia.location,
    children: rand(1..2) == 1,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    profile_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fillustration%2Fangry-birds-3d.html&psig=AOvVaw3iHiCjmUyX0bxBrVzSAedf&ust=1724252457788000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLiE3ovrg4gDFQAAAAAdAAAAABAJ"
  )
  list << user
end
while list_pet.size < 5
  p list
  pet = Pet.create!(
    name: Faker::Creature::Dog.name,
    kind: ["dog", "cat", "bird", "rabbit"].sample,
    age: rand(0..8),
    details: Faker::GreekPhilosophers.quote,
    user: list.sample,
    picture_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2IH4b3hvDu80YCgesuXzZuXQB7_OZ7_sffw&s"
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
