class CarWishesController < ApplicationController
  before_action :set_car

  def index
    @car_wishes = Car_Wish.all
  end

  def new
    @car_wish = Car_Wish.new
  end

  def create
    @car_wish = Car_Wish.new(car_wish_params)
    @car_wish.user = current_user
    @car_wish.car = @car

    if @car_wish.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def destroy
    @car_wish = Car_Wish.find(params[:id])
    @car_wish.destroy

    redirect_to cars_path
  end

   private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def car_wish_params
    params.require(:car_wish).permit(:user_id, :car_id)
  end
end
