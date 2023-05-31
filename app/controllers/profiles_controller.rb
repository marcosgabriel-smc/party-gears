class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  def my_profile
    @user = current_user
  end

  def show
    @gear = Gear.find(params[:gear_id])
    @user = User.find(@gear.user_id)
  end
end
