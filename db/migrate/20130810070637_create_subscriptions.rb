class CreateSubscriptions < ActiveRecord::Migration
  def up
    # Create subscriptions
    create_table :subscriptions do |t|
      t.string :gocardless_id
      t.references :user, index: true
      t.datetime :cancelled_at
      t.timestamps
    end
    # Create subscription objects for each user that is subscribed
    User.all.each do |user|
      if user.subscription_id
        user.subscriptions.create(gocardless_id: user.subscription_id)
      end
    end
    # Drop user field
    remove_column :users, :subscription_id
  end

  def down
    # Reinstate subscription id field
    add_column :users, :subscription_id, :string
    # Set ID for each user
    User.all.each do |user|
      sub = user.subscriptions.active
      if sub
        user.subscription_id = sub.gocardless_id
        user.save validate: false
      end
    end
    # Remove subscriptions table
    drop_table :subscriptions
  end

end
