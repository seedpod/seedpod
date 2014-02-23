class AddSizeToGiftCodes < ActiveRecord::Migration
  def change
    add_column :gift_codes, :size, :string, default: "medium"
  end
end
