class AddAddressDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address_street, :string
    add_column :users, :address_locality, :string
    add_column :users, :address_region, :string
    add_column :users, :address_postcode, :string
    add_column :users, :name, :string
  end
end
