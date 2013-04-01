class AddPublishedAndSummaryToPods < ActiveRecord::Migration
  def change
    add_column :pods, :published, :boolean, :default => false
    add_column :pods, :summary, :text
  end
end
