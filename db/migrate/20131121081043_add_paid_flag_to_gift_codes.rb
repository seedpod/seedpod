class AddPaidFlagToGiftCodes < ActiveRecord::Migration
  def change
    add_column :gift_codes, :paid, :boolean, :default => false
  end
end
