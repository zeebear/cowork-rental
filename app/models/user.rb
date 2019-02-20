class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :bookings, dependent: :destroy
  has_many :owned_offices, foreign_key: 'user_id', class_name: 'Office', dependent: :destroy
  has_many :booked_offices, through: :bookings, source: :office, dependent: :destroy
  has_many :reviews, through: :bookings

end
