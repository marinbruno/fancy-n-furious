class CarWishesController < ApplicationController
  before_action :set_car, except: [:destroy]

  def index
    @car_wishes = CarWish.all
  end

  def new
    @car_wish = CarWish.new
  end

  def create
    @car_wish = CarWish.new
    @car_wish.user = current_user
    @car_wish.car = @car

    if @car_wish.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def destroy

    @car_wish = CarWish.find(params[:id])
    @car = @car_wish.car
    @car_wish.destroy

    redirect_to car_path(@car)
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def car_wish_params
    params.require(:car_wish).permit(:user_id, :car_id)
  end
end
