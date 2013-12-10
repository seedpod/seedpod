class AddOrganicFlagToGiftCodes < ActiveRecord::Migration
  def change
    add_column :gift_codes, :organic, :boolean
  end
end
