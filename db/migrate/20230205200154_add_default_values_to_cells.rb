class AddDefaultValuesToCells < ActiveRecord::Migration[7.0]
  def change
    change_column_default :cells, :flagged, false
    change_column_default :cells, :mine, false
    change_column_default :cells, :revealed, false
  end
end
