class AddSenderTypeAndRecipientTypeToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :sender_type, :text
    add_column :messages, :recipient_type, :text
  end
end
