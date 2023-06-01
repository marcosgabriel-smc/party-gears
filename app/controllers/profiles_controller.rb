class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_user

  def my_profile
    ## Assingning different values so the sorts puts the true/false  in an order
    @my_gears = Gear.where(user: @user)
    @reservations = @user.offers.sort_by{|offer| offer.start_date}
    @my_offers = Offer.joins(gear: :user).where(users: { id: current_user.id })
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
