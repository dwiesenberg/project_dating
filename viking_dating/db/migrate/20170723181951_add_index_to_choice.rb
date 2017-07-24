class AddIndexToChoice < ActiveRecord::Migration[5.0]
  def change
    remove_index :choices, :question_id
    add_index :choices, [:question_id, :position], unique: true
  end
end
