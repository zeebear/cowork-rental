class Booking < ApplicationRecord
  belongs_to :office
  belongs_to :user
  validates :office, :user, :start_date, :end_date, presence: true
end
