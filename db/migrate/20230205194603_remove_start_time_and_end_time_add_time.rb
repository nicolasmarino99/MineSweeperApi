class RemoveStartTimeAndEndTimeAddTime < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :start_time
    remove_column :games, :end_time
    add_column :games, :time, :datetime
  end
end
