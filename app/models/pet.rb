class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :profile_picture
  SPECIES = %w(dog cat bird rabbit)
  #validates :kind, inclusion: { in: SPECIES, message: "%{value} is not a value species" }
end
