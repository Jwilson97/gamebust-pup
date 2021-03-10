class GamesController < ApplicationController
  def index
    @games = Game.all
    # raise
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
    @game.user = current_user
    # @rental.game = @game
    # if @game.rentals != []
    #   @rental = Rental.find(params[:id])
    # end
    # raise
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    @game.save
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :price, :console, :category, :photo)
  end
end
