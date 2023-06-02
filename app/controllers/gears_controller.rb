class GearsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show categories]
  before_action :set_gear, only: %i[show edit update destroy]
  before_action :set_user

  def index
    @gears = Gear.all
    @user = current_user if user_signed_in?
    return unless params[:query].present?

    sql_subquery = "name ILIKE :query OR description ILIKE :query"
    @gears = @gears.where(sql_subquery, query: "%#{params[:query]}%")
  end

  def show
    has_old_offer = Offer
                    .where('end_date < ?', Date.today)
                    .exists?(user_id: current_user, gear_id: @gear, confirmed: true)

    @review = Review.new if has_old_offer

    @offer = Offer.new
    @reviews = Review.where(gear: @gear)
  end

  def new
    @gear = Gear.new
  end

  def create
    @gear = Gear.new
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

  def categories
    @category = params[:category]
    @gears = Gear.where(category: @category)
  end

  private

  def set_gear
    @gear = Gear.find(params[:id])
  end

  def set_user
    @user = current_user if user_signed_in?
  end

  def gear_params
    params
      .require(:gear)
      .permit(:category, :name, :description, :image_url, :price, :user_id)
  end
end
