class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])

    @markers = [lat: @user.latitude, lng: @user.longitude]
  end

  def wishes
    @wishes = current_user.car_wishes
    @user = current_user
  end

  def bookings
    @bookings = current_user.bookings
    @user = current_user
  end

end
