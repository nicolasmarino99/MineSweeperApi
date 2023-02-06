class CreateExpertGames < ActiveRecord::Migration[7.0]
  def change
    create_table :expert_games do |t|
      t.timestamps
    end
  end
end
