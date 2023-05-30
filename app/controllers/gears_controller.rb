class GearsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_gear, only: %i[show edit update destroy]

  def index
    @gears = Gear.all
    @user = current_user if user_signed_in?
  end

  def show
    @offer = Offer.new
  end

  def new
    @gear = Gear.new
  end

  def create
    @gear = Gear.new
    @user = User.find(params[:user_id])
    @gear.user = @user
    if @gear.save
      redirect_to @gear
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @gear.update(gear_params)
      redirect_to @gear
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gear.destroy
    redirect_to gears_path
  end

  private

  def set_gear
    @gear = Gear.find(params[:id])
  end

  def gear_params
    params
      .require(:gear)
      .permit(:category, :name, :description, :image_url, :price, :user_id)
  end
end
