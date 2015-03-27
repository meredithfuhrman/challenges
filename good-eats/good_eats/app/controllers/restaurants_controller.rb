class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant added"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:notice] = "Invalid entry"
      redirect_to :back
    end
  end

  def show
    restaurant_id = params[:id]
    
    @restaurant = Restaurant.find(restaurant_id)
    @reviews = Review.where("restaurant_id = #{restaurant_id}")
  end

  protected
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zipcode,
      :description, :category)
  end
end
