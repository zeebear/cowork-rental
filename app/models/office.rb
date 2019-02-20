class Office < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :users, through: :bookings
  validates :user, :name, :address, :price, :workspace_type, presence: true
  validates :number_of_seats, :price, numericality: { greater_than_or_equal_to: 0 }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
end
