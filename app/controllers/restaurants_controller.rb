class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]
  def index
    @restaurants = Restaurant.all
  end
  def new
    @restaurant = Restaurant.new
  end
  def show

  end
  def edit
  end
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end
  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_patch
    else
      render :edit
    end
  end
   def destroy
    @restaurant = Restaurant.find(restaurant_params)
    @restaurant.destroy
    redirect_to restaurants_patch
  end
  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
