class RemoveGeographicalAreaFromEssentialAttributes < ActiveRecord::Migration[5.0]
  def change
    remove_column :essential_attributes, :geographical_area, :string
  end
end
