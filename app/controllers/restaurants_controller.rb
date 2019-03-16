class RestaurantsController < ApplicationController
 before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :chef]
  def chef
    @chef_name = @restaurant.chef
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurants_path
  end

  def edit
  end

  def update
   @restaurant.update(restaurant_params)
   redirect_to @restaurant
  end

  def destroy

    @restaurant.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path

  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :stars, :chef)

  end
end
