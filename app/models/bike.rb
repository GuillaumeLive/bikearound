class Bike < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  CATEGORIES = ['City bike', 'VTT', 'VTC', 'Race', 'Travel']
  SIZES = ['Man', 'Woman', 'Child']

  validates :name, presence: true
  validates :price, presence: true
  validates :photo, presence: true
  validates :localization, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORIES, allow_nil: false }
  validates :size, presence: true
  validates :size, inclusion: { in: SIZES, allow_nil: false }

  has_one_attached :photo

  geocoded_by :localization
  after_validation :geocode, if: :will_save_change_to_localization?
end
