class ReservationsController < ApplicationController
  before_action :set_offer, only: [:new, :create]

  def new
    @reservation = Reservation.new
  end

  def show
    @reservation = Reservation.find(params[:id])
    current_user.reservations
  end

  def create
    @reservation = Reservation.new(review_params)
    # @reservation = current_user.reservations.build(reservation_params)
    @reservation.offer = @offer

    if @reservation.save
      redirect_to root_path, notice: 'Reservation was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

   def reservation_params
     params.require(:reservation).permit(:date_begin, :date_end)
   end
end
