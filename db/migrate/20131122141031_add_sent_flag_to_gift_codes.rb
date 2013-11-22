class AddSentFlagToGiftCodes < ActiveRecord::Migration
  def change
    add_column :gift_codes, :sent, :boolean, default: false
  end
end
