class RenameMatchToClientsMatch < ActiveRecord::Migration[5.0]
  def change
    rename_table :matches, :clients_matches
    rename_column :clients_matches, :matched_id, :matchee_id
  end
end
