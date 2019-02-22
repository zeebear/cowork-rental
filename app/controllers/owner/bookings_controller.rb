class Owner::BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :approve]

  def index
    @bookings = policy_scope([:owner, Booking]).owned_bookings(current_user)
  end

  def edit
  end

  def approve
    raise
    @booking.update(booking_params)
    redirect_to bookings_path(@booking)
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
