class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, :booking, presence: true
end
