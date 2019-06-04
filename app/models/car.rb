class Car < ApplicationRecord
  belongs_to :user

  has_many :car_wishes
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :model, presence: true
  validates :brand, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :car_description, presence: true
  validates :category, presence: true
  validates :daily_amount, presence: true

  mount_uploader :photo, PhotoUploader
end
