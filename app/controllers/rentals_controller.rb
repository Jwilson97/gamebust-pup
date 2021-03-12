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
    @rental.status = "pending"
    @rental.save
    if @rental.save
      redirect_to rentals_path
    else
      render :new
    end
    # raise
  end

  def approve
    @game = Game.find(params[:game_id])
    @rental = Rental.find_by_id(params[:id])
    if @rental.user_id == current_user.id
      @rental.status = "approved"
      @rental.save
    end
  end

  def decline
    @game = Game.find(params[:game_id])
    @rental = Rental.find_by_id(params[:id])
    if @rental.user_id == current_user.id
      @rental.status = "declined"
      @rental.save
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :status)
  end
end
