class RentalsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @rental = Rental.new
  end

  def create
     @game = Game.find(params[:game_id])
     @rental = Rental.new(rental_params)
     @rental.user = current_user
     @rental.game = @game
     @rental.save
    if @rental.save
      redirect_to rentals_path
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
