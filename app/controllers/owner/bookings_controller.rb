class Owner::BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]
  def index
    @bookings = policy_scope([:owner, Booking]).order(created_at: :desc)
  end

  def edit
    authorize @booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
