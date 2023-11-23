class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @user_offers = @user.offers
    @user_reservations = @user.reservations
    @reservations_for_user = Reservation.joins(:offer).where(offers: { user_id: @user.id })
  end
end
