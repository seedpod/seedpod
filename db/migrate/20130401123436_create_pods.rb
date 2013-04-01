class CreatePods < ActiveRecord::Migration
  def change
    create_table :pods do |t|
      t.date :month

      t.timestamps
    end
  end
end
