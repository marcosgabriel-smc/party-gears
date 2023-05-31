class OffersController < ApplicationController
  before_action :set_offer, only: %i[show update destroy]

  def show
  end

  def new
    @offer = Offer.new(offer_params)
  end

  def create
    @offer = Offer.new(offer_params)
    @gear = Gear.find(params[:gear_id])
    @offer.gear = @gear
    @offer.user = current_user
    @offer.total_price = @gear.price * (@offer.end_date - @offer.start_date).to_i
    if @offer.save
      redirect_to gear_offer_path(@gear, @offer)
    else
      render 'gears/show', status: :unprocessable_entity
    end
  end

  def update
    if @offer.update(offer_params)
      redirect_to @gear
    else
      render 'gears/show', status: :unprocessable_entity
    end
  end

  def destroy
    @offer.destroy
    redirect_to @gear
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
    @gear = Gear.find(params[:gear_id])
  end

  def offer_params
    params.require(:offer).permit(:start_date, :end_date)
  end
end
