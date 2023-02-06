class CellGenerator
  attr_accessor :game, :cells

  def initialize(game)
    @game = game
    @cells = []
  end

  def generate_cells
    (0...game.rows).each do |row|
      (0...game.columns).each do |column|
        cells << game.cells.create(row:, column:)
      end
    end
  end

  def assign_random_mines
    mines_to_assign = game.mines
    while mines_to_assign > 0
      random_index = rand(cells.size)
      random_cell = cells[random_index]

      unless random_cell.mine
        random_cell.update(mine: true)
        mines_to_assign -= 1
      end
    end
  end
end
