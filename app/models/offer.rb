class Offer < ApplicationRecord
  belongs_to :gear
  belongs_to :renter, class_name: 'User', foreign_key: :renter_id
  # has_one :user, through: :gear
end
