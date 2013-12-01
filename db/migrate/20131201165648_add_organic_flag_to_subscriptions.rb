class AddOrganicFlagToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :organic, :boolean
  end
end
