class GamesController < ApplicationController

  def create
     @game = Game.new(params[:game])
     @game.save
    # if @game.save
    #   redirect_to new_game_path(@game)
    # else
    #   render :new
    # end
  end

  private

  # def game_params
  #   params.require(:game).permit(:name, :photo, :description)
  # end
end
