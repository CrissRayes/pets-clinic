class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.date :controldate
      t.float :wheight
      t.float :height
      t.text :description
      t.belongs_to :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
