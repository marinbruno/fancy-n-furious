class BookingsController < ApplicationController
  before_action :set_user
  before_action :set_car, except: [:index]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @booking = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.car = @car

    if @booking.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to car_path(@car)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy

    redirect_to cars_path
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_booking
    @bookng = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :car_id, :start_date, :end_date, :status, :total_amount)
  end
end
