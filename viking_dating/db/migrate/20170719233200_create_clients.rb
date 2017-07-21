class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :sex
      t.integer :age
      t.string :city
      t.string :state
      t.string :zip
      t.text :about_myself

      t.timestamps
    end
  end
end
