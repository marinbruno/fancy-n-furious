class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @cars = Car.search_by_all(params[:query])
    else
      @cars = Car.all
    end

    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { car: car }),
        image_url: helpers.asset_url('flag.svg')
      }
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def show
    @car = Car.find(params[:id])
    @user = current_user
    @markers = [lat: @car.latitude,
                lng: @car.longitude,
                infoWindow: render_to_string(partial: "infowindow", locals: { car: @car }),
                image_url: helpers.asset_url('flag.svg')
               ]
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:model, :car_location, :brand, :year, :car_description, :category, :daily_amount, :photo)
  end
end
