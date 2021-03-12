class GamesController < ApplicationController
  def index
    # @games = Game.all
    if params[:query].present?
      @games = policy_scope(Game).search_by_title_and_category_and_console(params[:query])
    else
      @games = policy_scope(Game)
    end
  end

  def new
    @game = Game.new
    authorize @game
  end

  def show
    @game = Game.find(params[:id])
    # raise
    authorize @game
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    authorize @game

    @game.save
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
    authorize @game
  end

  def update
    @game = Game.find(params[:id])
    authorize @game
    @game.update(game_params)

    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :price, :console, :category, :photo)
  end
end
