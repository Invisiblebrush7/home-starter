class BundlesOffer < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  has_many :bundled_furnitures
  has_many :furnitures, through: :bundled_furnitures
end
