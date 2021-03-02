class Bike < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true
  validates :photo, presence: true
  validates :localization, presence: true

  has_one_attached :photo
end
