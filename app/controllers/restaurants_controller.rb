class RestaurantsController < ApplicationController
  # :index, :show, :new, :create
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant: @restaurant)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant_params = params.require(:restaurant).permit(:name, :address, :category, :phone_number)
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end
end
