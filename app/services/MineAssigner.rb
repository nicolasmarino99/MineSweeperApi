class MineAssigner
  def initialize(game)
    @game = game
  end

  def assign
    cells = @game.cells.to_a
    mines_to_assign = @game.mines
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
