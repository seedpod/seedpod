class ChangeInstructionsFieldsToText < ActiveRecord::Migration
  def up
    change_column :instructions, :detail, :text, :limit => nil
  end
  def down
    change_column :instructions, :detail, :string
  end
end
