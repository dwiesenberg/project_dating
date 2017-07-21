class CreateEssentialAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :essential_attributes do |t|
      t.string :geographical_area
      t.string :sex
      t.integer :min_age
      t.integer :max_age
      t.integer :user_id

      t.timestamps
    end
  end
end
