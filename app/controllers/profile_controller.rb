class ProfileController < ApplicationController
  def show
    @user = current_user

    @markers = [lat: @user.latitude,
                lng: @user.longitude
                # infoWindow: render_to_string(partial: "infowindow", locals: { user: @user })
               ]
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
