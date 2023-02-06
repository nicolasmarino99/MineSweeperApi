class CreateIntermediateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :intermediate_games do |t|
      t.timestamps
    end
  end
end
