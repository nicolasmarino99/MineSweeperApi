class DropTableEasyGames < ActiveRecord::Migration[7.0]
  def change
    drop_table :easy_games
  end
end
