class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :message_text
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false

      t.timestamps
    end
    add_index :messages, [:sender_id, :recipient_id], unique: true 
  end
end



