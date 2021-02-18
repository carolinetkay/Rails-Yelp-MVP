class RestaurantsController < ApplicationController
  # :index, :show, :new, :create
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant_params = params.require(:restaurant).permit(:name, :address, :category, :phone_number)
    @new_restaurant = Restaurant.new(restaurant_params)

    if @new_restaurant.save
      redirect_to restaurant_path(@new_restaurant)
    else
      render :new
    end
  end
end
