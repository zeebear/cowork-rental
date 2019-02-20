class Booking < ApplicationRecord
  belongs_to :office
  belongs_to :user
  validates :office, :user, presence: true

  def self.owned_bookings(user)
    Booking.all.select do |booking|
      booking.office.user == user
    end
  end
end
