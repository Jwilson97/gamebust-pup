class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_games
    @games = Game.where(user: current_user)
    # rentals = @games.map do |game|
    #   game.rentals
    # end
    # @my_rentals = rentals.flatten
    @my_rentals = current_user.incoming_rentals
  end

  def rental
    @my_rentals = current_user.rentals
  end
end
