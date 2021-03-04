class Bike < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true
  validates :photo, presence: true
  validates :localization, presence: true

  has_one_attached :photo

  geocoded_by :localization
  after_validation :geocode, if: :will_save_change_to_localization?
end
