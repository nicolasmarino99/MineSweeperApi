class CreateEasyGames < ActiveRecord::Migration[7.0]
  def change
    create_table :easy_games do |t|

      t.timestamps
    end
  end
end
