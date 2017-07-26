class RenameUserIdToClientIdInEssentialAttributes < ActiveRecord::Migration[5.0]
  def change
    rename_column :essential_attributes, :user_id, :client_id
  end
end
