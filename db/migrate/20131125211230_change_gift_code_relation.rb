class ChangeGiftCodeRelation < ActiveRecord::Migration
  def change
    remove_column :gift_codes, :subscription_id
    add_column :subscriptions, :gift_code_id, :integer
  end
end
