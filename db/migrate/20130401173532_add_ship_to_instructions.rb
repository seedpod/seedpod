class AddShipToInstructions < ActiveRecord::Migration
  def change
    add_column :instructions, :ship, :boolean, :default => false
  end
end
