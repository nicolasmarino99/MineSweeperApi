class Cell < ApplicationRecord
  belongs_to :game

  enum status: { unrevealed: 0, revealed: 1, flagged: 2 }

  validates :row, :column, presence: true
  validates :row, :column, numericality: { only_integer: true }

  def reveal
    return if self.revealed || self.mine
    self.update(revealed: true)
    return if self.adjacent_mines > 0
    self.adjacent_cells.each { |cell| cell.reveal }
  end

  def adjacent_cells
    adjacents = []
    adjacents << self.game.cells.find_by(row: self.row - 1, column: self.column - 1)
    adjacents << self.game.cells.find_by(row: self.row - 1, column: self.column)
    adjacents << self.game.cells.find_by(row: self.row - 1, column: self.column + 1)
    adjacents << self.game.cells.find_by(row: self.row, column: self.column - 1)
    adjacents << self.game.cells.find_by(row: self.row, column: self.column + 1)
    adjacents << self.game.cells.find_by(row: self.row + 1, column: self.column - 1)
    adjacents << self.game.cells.find_by(row: self.row + 1, column: self.column)
    adjacents << self.game.cells.find_by(row: self.row + 1, column: self.column + 1)
    adjacents.compact
    end

    def adjacent_mines
      self.adjacent_cells.select { |cell| cell.mine }.count
    end
  def flag
    update(status: :flagged)
  end
end
