class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_user

  def my_profile
    @my_offers = Offer.where(user: @user)
  end

  def show
    @gear = Gear.find(params[:gear_id])
    @owner = @gear.user
  end

  private

  def set_user
    @user = current_user if user_signed_in?
  end

end
