class AddConditionToBundlesOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :bundles_offers, :condition, :string
  end
end
