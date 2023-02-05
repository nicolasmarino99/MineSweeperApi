class Game < ApplicationRecord
  include GameValidations

  belongs_to :user
  has_many :cells
  attr_accessor :time

  before_create :set_start_time
  after_update :set_end_time, if: :game_over?
  after_create :generate_cells

  def set_start_time
    @time_calculator = TimeCalculator.new
    self.time = 0
  end

  def set_end_time
    self.time = @time_calculator.elapsed_time
  end

  def game_over?
    cells.all? { |cell| cell.revealed || cell.mine }
  end

  private

  def generate_cells
    @cell_generator = CellGenerator.new(self)
    @cell_generator.generate_cells
    @cell_generator.assign_random_mines
  end
end
