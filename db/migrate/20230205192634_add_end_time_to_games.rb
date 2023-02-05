class AddEndTimeToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :end_time, :datetime
  end
end
