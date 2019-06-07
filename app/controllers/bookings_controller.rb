class BookingsController < ApplicationController
  before_action :set_user
  before_action :set_car
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # To be displayed inside the car's page.
  def new
    @booking = Booking.new
  end

  def index
    @booking = @car.bookings
  end

  # Checkout page
  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.car = @car
    @booking.total_amount = (@booking.end_date - @booking.start_date) * @car.daily_amount
    if @booking.save
      redirect_to bookings_path(current_user)
    else
      render :new
    end
  end

  # bookings#index page
  def show; end

  # edit form
  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to car_path(@car)
    else
      render :edit
    end
  end

  # booking#show page
  def destroy
    @booking.destroy

    redirect_to cars_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :car_id, :start_date, :end_date, :status, :total_amount)
  end
end
