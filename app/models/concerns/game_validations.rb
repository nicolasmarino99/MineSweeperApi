module GameValidations
  extend ActiveSupport::Concern

  included do
    validates :rows, :columns, :mines, presence: true
    validates_numericality_of :rows, greater_than: 1, less_than_or_equal_to: 100
    validates_numericality_of :columns, greater_than: 1, less_than_or_equal_to: 100
    validate :mines_do_not_exceed_cells
  end

  private

  def mines_do_not_exceed_cells
    total_cells = columns + rows
    return unless mines >= total_cells

    errors.add(:mines, "cannot exceed the total number of cells (#{total_cells})")
  end
end
