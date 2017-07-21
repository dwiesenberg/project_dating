class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :choice_id
      t.integer :priority
      t.references :question, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
