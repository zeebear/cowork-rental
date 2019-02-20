class Owner::BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]
  def index
    # @bookings = policy_scope([:booked_offices, Booking]).order(created_at: :desc)
    # @hola = current_user.booked_offices
    # raise
    @bookings = policy_scope([:owner, Booking]).owned_bookings(current_user)
  end

  def edit
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
