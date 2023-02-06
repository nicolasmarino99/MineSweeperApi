class GamesController < ApplicationController
  def index
    if current_user
      @games = current_user.games.all
      render json: @games
    else
      render json: { error: 'create user' }
    end
  end

  def create
    @game = current_user.games.create(game_params)
    @game.generate_cells
    if @game.save
      redirect_to game_path(@game)
    else
      render json: @game
    end
  end

  def show
    @game = Game.find(params[:id])
    render json: @game
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      @game.set_end_time if @game.game_over?
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  private

  def game_required_params
    params.require(:game).permit(:difficulty, :cols, :rows, :mines, :id)
  end

  def game_params
    case params[:difficulty]
    when 'easy'
      { rows: 5, columns: 5, mines: 5 }
    when 'intermediate'
      { rows: 10, columns: 10, mines: 10 }
    when 'hard'
      { rows: 15, columns: 15, mines: 15 }
    when 'custom'
      { rows: params[:rows], columns: params[:cols], mines: params[:mines] }
    end
  end
end
