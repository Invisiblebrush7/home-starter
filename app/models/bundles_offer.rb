class BundlesOffer < ApplicationRecord
  belongs_to :user
  has_many :bundled_furnitures
  has_many :furnitures, through: :bundled_furnitures
  has_many :reviews
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed" }
  validates :price, presence: true, numericality: { only_integer: true }
end