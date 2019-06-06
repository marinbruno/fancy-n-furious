class Car < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_all,
    against: [:model, :brand, :car_description, :year, :category],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  belongs_to :user

  has_many :car_wishes, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :model, presence: true
  validates :brand, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :car_description, presence: true
  validates :category, presence: true
  validates :daily_amount, presence: true

  mount_uploader :photo, PhotoUploader

  geocoded_by :car_location
  after_validation :geocode, if: :will_save_change_to_car_location?
end
