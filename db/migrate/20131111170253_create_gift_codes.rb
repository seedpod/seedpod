class CreateGiftCodes < ActiveRecord::Migration
  def change
    create_table :gift_codes do |t|
      t.string :code
      t.datetime :claimed_at
      t.integer :months
      t.references :user, index: true
      t.boolean :send_to_recipient
      t.string :purchaser_name
      t.string :purchaser_email
      t.string :recipient_name
      t.string :recipient_email
      t.date :send_date
      t.timestamps
    end
  end
end
