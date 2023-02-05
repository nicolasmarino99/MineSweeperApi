class GamesController < ApplicationController
  def create
    @game = if params[:difficulty] == 'easy'
              current_user.games.create(rows: 5, columns: 5, mines: 5)
            elsif params[:difficulty] == 'intermediate'
                current_user.games.create(rows: 10, columns: 10, mines: 10)
            elsif params[:difficulty] == 'hard'
                current_user.games.create(rows: 15, columns: 15, mines: 15)
            elsif params[:difficulty] == 'custom'
                current_user.games.create(rows: params[:rows], columns: params[:cols], mines: params[:mines])
            end
    @game.user = current_user
    @game.generate_cells
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
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

  def game_params
    params.require(:game).permit(:difficulty, :cols, :rows, :mines)
  end
end
