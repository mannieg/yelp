class RestaurantsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.create_with_user(restaurant_params,
                                                            current_user)

    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)

    redirect_to '/restaurants'
  end

  def destroy
   @restaurant = Restaurant.find(params[:id])
   if @restaurant.user == current_user
     @restaurant.destroy
     flash[:notice] = 'Restaurant deleted successfully'
   else
     flash[:notice] = 'Cannot delete restaurant'
   end
   redirect_to '/restaurants'
 end

 private

 def restaurant_params
   params.require(:restaurant).permit(:name, :description, :image)
 end
end
