class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)
    @game.save
    if @game.save
      redirect_to new_game_path(@game)
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :price, :console, :category, :photo)
  end
end
