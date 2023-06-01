class Gear < ApplicationRecord
  CATEGORIES = %w[DJ SOUND LIGHTING]

  belongs_to :user, class_name: 'User', foreign_key: :user_id

  has_many :offers, dependent: :destroy

  validates :name, :description, :price, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :price, numericality: true

  # def is_vailable?
  # end
end
