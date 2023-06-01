class Review < ApplicationRecord
  belongs_to :user
  belongs_to :gear
  validates :content, presence: true
end
