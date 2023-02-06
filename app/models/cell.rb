class Cell < ApplicationRecord
  belongs_to :game

  enum status: { unrevealed: 0, revealed: 1, flagged: 2 }

  validates :row, :column, presence: true
  validates :row, :column, numericality: { only_integer: true }

  def reveal
    return if revealed || mine

    update(revealed: true)
    return if adjacent_mines > 0

    adjacent_cells.each { |cell| cell.reveal }
  end

  def adjacent_cells
    adjacents = []
    adjacents << game.cells.find_by(row: row - 1, column: column - 1)
    adjacents << game.cells.find_by(row: row - 1, column:)
    adjacents << game.cells.find_by(row: row - 1, column: column + 1)
    adjacents << game.cells.find_by(row:, column: column - 1)
    adjacents << game.cells.find_by(row:, column: column + 1)
    adjacents << game.cells.find_by(row: row + 1, column: column - 1)
    adjacents << game.cells.find_by(row: row + 1, column:)
    adjacents << game.cells.find_by(row: row + 1, column: column + 1)
    adjacents.compact
  end

  def adjacent_mines
    adjacent_cells.select { |cell| cell.mine }.count
  end

  def flag
    update(status: :flagged)
  end
end
