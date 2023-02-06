class CreateCells < ActiveRecord::Migration[7.0]
  def change
    create_table :cells do |t|
      t.integer :row
      t.integer :column
      t.boolean :mine
      t.boolean :revealed
      t.boolean :flagged
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
