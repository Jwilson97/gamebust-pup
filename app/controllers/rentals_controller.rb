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
    @rental.save
    if @rental.save
      # @game.rentals.each do |rental|
      #   rental.status = false
      # end
      @rental.status = false
      redirect_to rentals_path
    else
      render :new
    end
    # raise
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :status)
  end
end
