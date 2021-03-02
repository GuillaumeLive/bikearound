class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :start_at, presence: true
  validates :end_at, presence: true
end
