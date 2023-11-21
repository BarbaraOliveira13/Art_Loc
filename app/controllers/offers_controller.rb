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
    @offer = Offer.new(params_offer)
    @offer.user_id = current_user.id
    if @offer.save!
      redirect_to root_path, notice: "Offer was successfully created."
    else
      render :new
    end
  end

  def update
    if @offer.update(params_offer)
    redirect_to @offer, notice: "'Offer was successfully updated"
   else
    render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_path, notice: 'Offer was successfully destroyed.'
  end

private

def params_offer
  params.require(:offer).permit(:title, :price, :content, :category)
end

def set_offer
  @offer = Offer.find(params[:id])
end

end
