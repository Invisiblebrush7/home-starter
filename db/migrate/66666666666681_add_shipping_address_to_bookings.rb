class AddShippingAddressToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :shipping_address, :string
    add_column :bookings, :payment_info, :string
  end
end
