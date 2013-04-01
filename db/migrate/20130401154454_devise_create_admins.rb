class DeviseCreateAdmins < ActiveRecord::Migration
  def change
    create_table(:admins) do |t|
      t.string :email,              :null => false
      t.string :encrypted_password, :null => false
      ## Rememberable
      t.datetime :remember_created_at
      
      t.timestamps
    end

    add_index :admins, :email,                :unique => true
  end
end
