class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(set_restaurant)
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.save
    redirect_to restaurant_path(params[:restaurant_id])
  end
  def destroy
    review.destroy
    redirect_to restaurant_path(params[:restaurant_id])
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :user)
  end

end
