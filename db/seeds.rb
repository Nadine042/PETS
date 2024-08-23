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

pet_urls = {
  dogs: [
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349861/Dog2_rsgl1a.jpg",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349861/Dog4_d1fvkd.jpg",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349860/Dog3_hrfthk.jpg",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349859/Dog5_le4gux.jpg",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349849/Dog1_nlrh2q.jpg"
  ],
  cats: [
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349875/Cat4_apdtz6.jpg",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349874/Cat5_civjs3.jpg",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349871/Cat6_ey2mf2.jpg",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349870/Cat7_fakcjm.jpg",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349875/Cat3_k461iw.jpg"
  ],
  birds: [
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349893/Bird3_etndzh.jpg",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349893/Bird2_qvauic.webp",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349893/Bird1_yj0zom.jpg",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349892/Bird4_e6lawp.jpg",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349892/Bird5_jxjm8t.jpg"
  ],
  rabbits: [
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349895/Rabbit1_l3kj86.webp",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349893/Rabbit3_vev4tx.webp",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349893/Rabbit2_fxaorv.jpg",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349893/Rabbit5_gnaydz.jpg",
    "https://res.cloudinary.com/dwalfnpav/image/upload/v1724349891/Rabbit4_r5btef.webp"
  ]
}


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
5.times do |index|
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    kind: "dog",
    age: rand(0..8),
    details: Faker::GreekPhilosophers.quote,
    start_date: Faker::Date.between(from: '2024-09-1', to: '2024-10-1'),
    end_date: Faker::Date.between(from: '2024-11-5', to: '2024-11-7'),
    user: list.sample,
  )

  file2 = URI.open(pet_urls[:dogs][index])
  pet.profile_picture.attach(io: file2, filename: 'student_one.png', content_type: 'image/png')

  pet.save
end
5.times do |index|
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    kind: "cat",
    age: rand(0..8),
    details: Faker::GreekPhilosophers.quote,
    start_date: Faker::Date.between(from: '2024-09-1', to: '2024-10-1'),
    end_date: Faker::Date.between(from: '2024-11-5', to: '2024-11-7'),
    user: list.sample,
  )

  file3 = URI.open(pet_urls[:cats][index])
  pet.profile_picture.attach(io: file3, filename: 'student_one.png', content_type: 'image/png')

  pet.save
end
5.times do |index|
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    kind: "bird",
    age: rand(0..8),
    details: Faker::GreekPhilosophers.quote,
    start_date: Faker::Date.between(from: '2024-09-1', to: '2024-10-1'),
    end_date: Faker::Date.between(from: '2024-11-5', to: '2024-11-7'),
    user: list.sample,
  )

  file4 = URI.open(pet_urls[:birds][index])
  pet.profile_picture.attach(io: file4, filename: 'student_one.png', content_type: 'image/png')

  pet.save
end
5.times do |index|
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    kind: "rabbit",
    age: rand(0..8),
    details: Faker::GreekPhilosophers.quote,
    start_date: Faker::Date.between(from: '2024-09-1', to: '2024-10-1'),
    end_date: Faker::Date.between(from: '2024-11-5', to: '2024-11-7'),
    user: list.sample,
  )

  file5 = URI.open(pet_urls[:rabbits][index])
  pet.profile_picture.attach(io: file5, filename: 'student_one.png', content_type: 'image/png')

  pet.save
end
