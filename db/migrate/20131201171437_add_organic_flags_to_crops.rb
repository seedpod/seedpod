class AddOrganicFlagsToCrops < ActiveRecord::Migration
  def change
    add_column :crops, :organic, :boolean, default: false
    add_column :crops, :non_organic, :boolean, default: true
  end
end
