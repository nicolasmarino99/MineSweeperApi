class DropTableIntermediateGames < ActiveRecord::Migration[7.0]
  def change
    drop_table :intermediate_games
  end
end
