class Booking < ApplicationRecord
  belongs_to :office
  belongs_to :user

end
