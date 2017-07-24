class AddIndexToAnswer < ActiveRecord::Migration[5.0]
  def change
    remove_index :answers, :client_id
    remove_index :answers, :question_id
    add_index :answers, [:client_id, :question_id], unique: true
      # used for calculating client scores
  end
end
