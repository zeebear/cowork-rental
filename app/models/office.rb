class Office < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :users, through: :bookings
  validates :user, :name, :price, :workspace_type, :number_of_seats, presence: true
  validates :number_of_seats, :numericality => { :greater_than_or_equal_to => 0 }
end
