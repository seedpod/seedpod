class AddSizesToCrops < ActiveRecord::Migration
  def change
    add_column :crops, :small, :boolean, default: false
    add_column :crops, :medium, :boolean, default: false
    add_column :crops, :large, :boolean, default: false
  end
end
