class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_booking
  def new
    @review = Review.new
    @review.booking = @booking
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to office_path(@booking.office)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
