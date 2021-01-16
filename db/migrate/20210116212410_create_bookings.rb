class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :shipping_method
      t.string :start_date
      t.string :end_date
      t.references :bundles_offers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
