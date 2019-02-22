class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_booking
  def new
    @review = Review.new
    @review.booking = @booking
    authorize @review
  end

  def create
    @review = Review.new
    @review.rating = params['rating']
    @review.content = params['content']
    @review.booking = Booking.find(params['booking_id'])
    authorize @review

    bookings = []
    office = @review.booking.office
    Booking.where(user: current_user).where(office: office).each do |b|
      bookings << b if b.review.nil?
    end
    @booking = bookings.first
    authorize @booking unless @booking.nil?

    if @review.save
      respond_to do |format|
        format.html { redirect_to @booking }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'offices/show' }
        format.js # <-- idem
      end
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
