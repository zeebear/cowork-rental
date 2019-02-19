class Booking < ApplicationRecord
  belongs_to :office
  belongs_to :user
  validates :office, :user, presence: true
end
