class ChangeMessageColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :sender_id, :sendable_id
    rename_column :messages, :sender_type, :sendable_type
    rename_column :messages, :recipient_id, :receivable_id
    rename_column :messages, :recipient_type, :receivable_type
  end
end
