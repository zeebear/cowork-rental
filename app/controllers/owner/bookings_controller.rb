class Owner::BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :approve]

  def index
    @bookings = policy_scope([:owner, Booking]).owned_bookings(current_user)
  end

  def edit
  end

  def approve
    # @booking.update_status(booking_params["status"])
    # redirect_to owner_booking_path(@booking)

    @booking.status = booking_params[:status]
    @booking.save

    # return redirect_to bookings_path if @booking.save && current_user == @booking.user
    return redirect_to owner_bookings_path if @booking.save

    render :edit
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize [:owner, @booking]
  end

  def booking_params
    params.require(:booking).permit(:status)
  end
end
