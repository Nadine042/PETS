# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'
require 'faker'
list = []
user_pics = [
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409963/clarissa-cruz-headshot-people-f4197aa2a3b44efb90f907198d950c8d_iy8peb.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409962/Chris-Pratt_utkbfp.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409961/alexandre-abitbol_rpcffj.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409960/how-to-stop-being-a-people-pleaser-1_1_frbwnp.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409959/TaylorSwift_PEOPLE_2-3ae7b9b0cfee4c869253ec38306a5ead_awcfpi.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409958/Jonah-Hill_c9j4fw.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409957/91622_People_Wendy_Naugle_S3_1255_FNL_preview-4ac906ede68e4de68aaabe483a7a0d4f_ozxiib.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409956/p-5_gdd0hk.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409956/Adam-Mastroianni-square_vlqyua.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409915/canva-brown-and-light-brown_2C-circle-framed-instagram-profile-picture-2PE9qJLmPac_zgoh18.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409911/canva-yellow-inspiration-modern-instagram-profile-picture-kpZhUIzCx_w_t73xyo.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409912/profile_yqkaez.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409908/premium_photo-1671656333460-a3a85854d01e_trngy7.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409907/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e_anwl34.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409909/profile-picture_mhkuav.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409906/7K5BkEX8HqQShfGMFH3NuzAgOgIxdzBASWwsBW1FenQPy1cW5alzsLtQirKzLC4ces7_1GXnMNeOso6RYz1-A8hWPXZismqXm0pMl7UWH1ObjQlsZQ_w1440-v1-e30_dwxkdn.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409753/premium_photo-1673866484792-c5a36a6c025e_vcqehd.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409749/canva-green-gradient-minimalist-simple-instagram-profile-picture-tBlf3wVYGhg_jd3yut.jpg",
  "https://res.cloudinary.com/do9ythsfg/image/upload/v1724409749/wp-2021-01-linkedin-profile-picture-after_h56daq.jpg"
]
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
    password_confirmation: "password"
  )
  list << user
  user_file = URI.open(user_pics.last)
  user.photo.attach(io: user_file, filename: 'student_one.png', content_type: 'image/png')
  user_pics.pop
end
5.times do |index|
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    kind: "dog",
    age: rand(0..8),
    details: Faker::GreekPhilosophers.quote,
    start_date: Faker::Date.between(from: '2024-09-1', to: '2024-10-1'),
    end_date: Faker::Date.between(from: '2024-11-5', to: '2024-11-7'),
    user: list.sample
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
    user: list.sample
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
    user: list.sample
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
    user: list.sample
  )

  file5 = URI.open(pet_urls[:rabbits][index])
  pet.profile_picture.attach(io: file5, filename: 'student_one.png', content_type: 'image/png')

  pet.save
end
