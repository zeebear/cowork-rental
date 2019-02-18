class Booking < ApplicationRecord
  belongs_to :office_id
  belongs_to :user_id
end
