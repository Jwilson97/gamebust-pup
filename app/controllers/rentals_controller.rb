class RentalsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @rental = Rental.new
  end

  def create
     @rental = Rental.new(rental_params)
     @rental.save
    if @rental.save
      redirect_to new_rental_path(@rental)
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:game).permit(:start_date, :end_date, :status)
  end
end
