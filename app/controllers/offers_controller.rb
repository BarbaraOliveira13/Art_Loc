class OffersController < ApplicationController
  before_action :set_offer, only: %i[show edit update destroy]

  def index
    @offers = Offer.all
    if params[:query].present?
      sql_subquery = "title ILIKE :query OR category ILIKE :query"
      @offers = @offers.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def user_offers
    curent_user.offers
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(params_offer)
    @offer.user_id = current_user.id
    if @offer.save
      redirect_to dashboard_path, notice: "Offer was successfully created."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @offer.update(params_offer)
    redirect_to @offer, notice: "'Offer was successfully updated"
   else
    render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to root_path, notice: 'Offer was successfully destroyed.'
  end

private

def params_offer
  params.require(:offer).permit(:title, :price, :content, :category, :photo)
end

def set_offer
  @offer = Offer.find(params[:id])
end
end
