class Offer < ApplicationRecord
  belongs_to :gear
  belongs_to :user # the renter

  validates :start_date, comparison: { greater_than_or_equal_to: Date.today }
  validates :end_date, comparison: { greater_than: :start_date }
end
