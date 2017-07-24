class AddReadToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :read, :boolean, default: false
    add_column :messages, :desire_to_like_you, :integer, default: 0
    add_index :messages, [:read, :updated_at]
  end
end
