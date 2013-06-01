class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.references :pod, index: true
      t.references :user, index: true
      t.boolean :shipped, default: false

      t.timestamps
    end
  end
end
