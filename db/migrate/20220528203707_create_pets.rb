class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :race
      t.date :birthday
      t.belongs_to :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
