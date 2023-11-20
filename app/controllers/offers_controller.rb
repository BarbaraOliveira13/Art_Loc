class OffersController < ApplicationController
  before_action :set_offer, only: %i[show edit update destroy]
  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def edit
  end

  def create
    offer = Offer.new(params_offer)
    offer.save
    redirect_to offers_path
  end

  def update
    @offer.update(params_offer)
    redirect_to offers_path(@offer)
  end

  def destroy
    @offer.destroy
    redirect_to offers_path
  end

private

def params_offer
  params.require(:offer).permit(:title, :price, :content, :category)
end

def set_offer
  @offer = Offer.find(params[:id])
end

end
