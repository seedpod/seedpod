class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :summary
      t.string :detail
      t.references :crop, index: true
      t.references :pod, index: true

      t.timestamps
    end
  end
end
