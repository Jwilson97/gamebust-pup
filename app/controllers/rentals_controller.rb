class RentalsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @rental = Rental.new
    # raise
  end

  def create
    @game = Game.find(params[:game_id])
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.game = @game
    @rental.status = "request"
    @rental.save
    if @rental.save
      redirect_to rentals_path
    else
      render :new
    end
    # raise
  end

  def approved
    @rental.status == "approved"
  end

  def declined
    @rental.status == "declined"
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :status)
  end
end
