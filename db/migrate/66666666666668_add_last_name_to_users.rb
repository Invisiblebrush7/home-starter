class AddLastNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :shipping_address, :string
    add_column :users, :phone_number, :string
  end
end
