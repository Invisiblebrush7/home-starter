class BundledFurniture < ApplicationRecord
  belongs_to :furniture
  belongs_to :bundles_offer
end
