class CellsController < ApplicationController
  before_action :set_cell, only: %i[reveal flag]

  def reveal
    if @cell.revealed || @cell.flagged
      render json: { error: 'Cell already revealed or flagged' }, status: :bad_request
    else
      @cell.reveal
      render json: @cell, status: :ok
    end
  end

  def flag
    if @cell.revealed
      render json: { error: 'Cannot flag revealed cell' }, status: :bad_request
    else
      @cell.flag
      render json: @cell, status: :ok
    end
  end

  private

  def set_cell
    @cell = Cell.find(params[:id])
  end
end
