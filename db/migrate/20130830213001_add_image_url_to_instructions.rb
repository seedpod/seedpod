class AddImageUrlToInstructions < ActiveRecord::Migration
  def change
    add_column :instructions, :image_url, :string
  end
end
