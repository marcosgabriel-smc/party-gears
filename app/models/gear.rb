class Gear < ApplicationRecord
  CATEGORIES = %w[DJ SOUND LIGHTING]

  include PgSearch::Model
  pg_search_scope(
    :search,
    against: %i[name description],
    using: {
      tsearch: { prefix: true }
    }
  )

  belongs_to :user, class_name: 'User', foreign_key: :user_id

  has_many :offers, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :description, :price, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :price, numericality: true
end
