class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string     :gocardless_id
      t.references :subscription, index: true
      t.float      :amount
      t.datetime   :transacted_at
      t.string     :state
      t.timestamps
    end
  end
end
