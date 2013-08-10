class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :gocardless_id
      t.references :subscription, index: true
      t.float :amount
      t.datetime :paid_at
      t.boolean :success

      t.timestamps
    end
  end
end
