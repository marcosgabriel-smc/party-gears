class OffersController < ApplicationController
  before_action :set_offer, except: :create

  def create
    @offer = Offer.new(offer_params)
    @gear = Gear.find(params[:gear_id])
    @offer.gear = @gear
    @offer.user = current_user
    if @offer.save
      redirect_to @gear
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
