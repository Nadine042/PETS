class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  # SPECIES = %w(dog cat bird rabbit)
  # validates :species, inclusion: { in: SPECIES }
end
