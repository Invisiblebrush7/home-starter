class AddBundlesOfferReftoBundledFurniture < ActiveRecord::Migration[6.0]
  def change
    add_reference :bundled_furnitures, :bundles_offer, foreign_key: true
    remove_reference :bundled_furnitures, :bundles_offers, index: true, foreign_key: true
  end
end
