Rails.application.routes.draw do
# User stories:
# 1. A visitor can see the list of all restaurants
# 2. A visitor can add a new restaurant, and be redirected to the show view of that new restaurant
# 3. A visitor can see the details of a restaurant, with all the reviews related to the restaurant
# 4. A visitor can add a new review to a restaurant
  resources :restaurants, only: [ :index, :show, :new, :create ] do
    resources :reviews, only: [ :index, :new, :create ]
  end
end
