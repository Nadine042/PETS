class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.integer :age
      t.string :details
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
