class ReviewsController < ApplicationController
  def index
    @car = Car.find(params[:car_id])
    @reviews = @car.reviews
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to car_reviews_path
    else
      render :new
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to car_reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
