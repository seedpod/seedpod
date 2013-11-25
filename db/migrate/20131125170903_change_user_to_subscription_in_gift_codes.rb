class ChangeUserToSubscriptionInGiftCodes < ActiveRecord::Migration
  def change
    rename_column :gift_codes, :user_id, :subscription_id
  end
end
