class AddSizeToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :size, :string, default: "medium"
  end
end
