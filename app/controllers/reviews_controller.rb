class ReviewsController < ApplicationController
  # :index, :new, :create
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = Review.where(restaurant: @restaurant)
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    review_params = params.require(:review).permit(:content, :rating)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_reviews_path(@restaurant)
    else
      render :new
    end
  end
end