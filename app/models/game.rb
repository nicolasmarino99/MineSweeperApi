class Game < ApplicationRecord
  belongs_to :user
  has_many :cells
  attr_accessor :time

  validates :rows, :columns, :mines, presence: true
  validate :mines_do_not_exceed_cells

  before_create :set_start_time
  after_update :set_end_time, if: :game_over?
  after_create :generate_cells, :assign_random_mines

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

  def mines_do_not_exceed_cells
    total_cells = columns * rows
    return unless mines >= total_cells

    errors.add(:mines, "cannot exceed the total number of cells (#{total_cells})")
  end
end
