class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
  end

  def my_games
    @games = Game.where(user: current_user)
    rentals = @games.map do |game|
      game.rentals
    end
    @my_rentals = rentals.flatten
    # raise
  end

  # def approved
  #   @games = Game.where(user: current_user)
  #   rentals = @games.map do |game|
  #     game.rentals
  #   end
  #   @my_rentals = rentals.flatten
  #   @rental.status = "approved"
  #   @rental.save
  #   # raise
  # end

  # def declined
  #   @rental.status = "declined"
  #   @rental.save
  #   # raise
  # end

  def rental
    @user = current_user
  end
end
