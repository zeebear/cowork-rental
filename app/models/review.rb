class Review < ApplicationRecord
  belongs_to :booking

  #this is a global constant accesable with using syntax 'Review::STARS'
  STARS = (1..5).to_a
  validates :booking, presence: true
  validates :rating, inclusion: {in: STARS}
end

