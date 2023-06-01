class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @gear = Gear.find(params[:gear_id])
    @review.gear = @gear
    @review.user = current_user
    if @review.save
      redirect_to @gear
    else
      render "gears/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:user, :gear, :content)
  end
end
