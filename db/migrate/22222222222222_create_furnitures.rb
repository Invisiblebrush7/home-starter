class CreateFurnitures < ActiveRecord::Migration[6.0]
  def change
    create_table :furnitures do |t|
      t.string :name
      t.text :description
      t.string :dimensions
      t.integer :price
      t.string :condition
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
