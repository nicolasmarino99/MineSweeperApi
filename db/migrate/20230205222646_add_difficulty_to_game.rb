class AddDifficultyToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :difficulty, :string
  end
end
