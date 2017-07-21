class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :score
      t.integer :thumb
      t.integer :matcher_id, null: false
      t.integer :matched_id, null: false

      t.timestamps
    end
    add_index :matches, [:matcher_id, :matched_id], unique: true 
  end
end
