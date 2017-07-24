class AddIndexToClientsMatch < ActiveRecord::Migration[5.0]
  def change
    add_index(:clients_matches, [:matcher_id, :thumb, :score], order: {matcher_id: :asc, thumb: :desc, score: :desc})
  end
end


