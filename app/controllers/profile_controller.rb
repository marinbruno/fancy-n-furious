class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
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
