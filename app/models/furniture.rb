class Furniture < ApplicationRecord
  belongs_to :user

  has_many :bundled_furnitures
  has_many :bundles_offer, through: :bundled_furnitures
end
