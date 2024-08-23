class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :profile_picture
  SPECIES = %w(dog cat bird rabbit)
  # validates :kind, inclusion: { in: SPECIES, message: "%{value} is not a value species" }
  validates :age, numericality: { greater_than_or_equal_to: 0 }
  validates :name, :age, :details, :kind, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :start_date, comparison: { greater_than: Date.today }
end
