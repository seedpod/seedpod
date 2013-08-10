class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string     :gocardless_id
      t.references :subscription, index: true
      t.float      :amount
      t.datetime   :transacted_at
      t.string     :state, default: 'pending'
      t.timestamps
    end
  end
end
