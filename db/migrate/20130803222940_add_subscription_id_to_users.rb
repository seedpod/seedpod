class AddSubscriptionIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscription_id, :string
  end
end
