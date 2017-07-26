class ChangeColumnDefaultInClientsMatch < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:clients_matches, :score, 0)
    change_column_default(:clients_matches, :thumb, 0)
  end
end
