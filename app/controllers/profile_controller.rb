class ProfileController < ApplicationController
  def show
    if user_check
      @user = User.find(params[:id])
    else
      @user = current_user
    end

    @markers = [lat: @user.latitude,
                lng: @user.longitude,
                infoWindow: render_to_string(partial: "infowindow", locals: { user: @user }),
                image_url: helpers.asset_url('flag.svg')
               ]
  end

  def wishes
    if user_check
      @user = User.find(params[:id])
      @wishes = @user.car_wishes
    else
      @wishes = current_user.car_wishes
      @user = current_user
    end
  end

  def bookings
    if user_check
      @user = User.find(params[:id])
      @bookings = @user.bookings
    else
      @bookings = current_user.bookings
      @user = current_user
    end
  end

  private

  def user_check
    User.find(params[:id])
  end
end
