class RentalsController < ApplicationController
  def create
     @rental = Rental.new(rental_params)
     @rental.save
    if @rental.save
      redirect_to new_grental_path(@rental)
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:game).permit(:start_date, :end_date, :status)
  end
end
