class CreateGiftCodes < ActiveRecord::Migration
  def change
    create_table :gift_codes do |t|
      t.string :code
      t.datetime :claimed_at
      t.integer :months
      t.references :user, index: true

      t.timestamps
    end
  end
end
