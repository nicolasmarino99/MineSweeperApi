class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :rows
      t.integer :columns
      t.integer :mines
      t.datetime :finished_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
