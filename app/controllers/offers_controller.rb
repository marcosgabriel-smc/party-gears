class OffersController < ApplicationController
  before_action :set_offer, except: :create

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to @offer.gear
    else
      render 'gear/show', status: :unprocessable_entity
    end
  end

  def update
    if @offer.update(offer_params)
      redirect_to @gear
    else
      render 'gear/show', status: :unprocessable_entity
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
    params.require(:offer).permit(:gear, :start_date, :end_date, :is_accepted)
  end
end
