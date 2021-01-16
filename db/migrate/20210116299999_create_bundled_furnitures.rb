class CreateBundledFurnitures < ActiveRecord::Migration[6.0]
  def change
    create_table :bundled_furnitures do |t|
      t.references :furniture, null: false, foreign_key: true
      t.references :bundles_offers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
