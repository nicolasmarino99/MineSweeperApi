class DropTableExpertGames < ActiveRecord::Migration[7.0]
  def change
    drop_table :expert_games
  end
end
