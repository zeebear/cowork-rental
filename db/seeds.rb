# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Office.destroy_all
# User.destroy_all

# owner = User.new(email: 'mati@gmail.com', password: 123456)
# owner.save!

# worker = User.new(email: 'worker@gmail.com', password: 123456)
# worker.save!

# office = Office.new(user: owner, name: 'La Maquinita Co', price: 150, number_of_seats: 1, workspace_type: 'desk', address: '16 Bishopstown Road, Cork')
# office.save!

# today = Date.today
# yesterday= Date.yesterday

# booking1 = Booking.new(office: office, user: worker, start_date: yesterday, end_date: yesterday)
# booking1.save!

# booking2 = Booking.new(office: office, user: worker, start_date: today, end_date: today)
# booking2.save!

# review1 = Review.new(rating: 5, content: "Amazing!!", booking: booking1)
# review1.save!

# review2 = Review.new(rating: 1, content: "Hated it this time!!", booking: booking2)
# review2.save!
ADDRESSES = [
  'Loyola 701, Buenos Aires, Argentina',
  'Armenia 1242, Buenos Aires, Argentina',
  'Gorriti 4738, Buenos Aires, Argentina',
  'Armenia 1641, Buenos Aires, Argentina',
  'Malabia 1510, Buenos Aires, Argentina',
  'Thames 1535, Buenos Aires, Argentina',
  'Guatemala 4516, Buenos Aires, Argentina',
  'Charcas 3702, Buenos Aires, Argentina',
  'Guatemala 4699, Buenos Aires, Argentina',
  'Av. Santa Fe 3856, Buenos Aires, Argentina',
  'Thames 1891, Buenos Aires, Argentina',
  'Honduras 4969, Buenos Aires, Argentina',
  'Av. Córdoba 5267, Buenos Aires, Argentina',
  'Serrano 1106, Buenos Aires, Argentina',
  'Gorriti 5657, Buenos Aires, Argentina',
  'Gorriti 5801, Buenos Aires, Argentina',
  'Costa Rica 5527, Buenos Aires, Argentina',
  'Humboldt 2000, Buenos Aires, Argentina',
  'Humboldt 1892, Buenos Aires, Argentina',
  'Humboldt 2192, Buenos Aires, Argentina'
]

DESKS = [
    'Desk by a window with a view',
    'Round table with 4 chairs',
    'Cozy corner table',
    'Private corner office with space for 10',
    'Desk for two with 4 monitors',
    'Huge desk in a shared office',
    'Desk in a private office'
]

puts "Creating 4 users"
User.create(email: 'claire@claire.com', password: 123456)
User.create(email: 'alfonso@alfonso.com', password: 123456)
User.create(email: 'bill@bill.com', password: 123456)
User.create(email: 'mati@mati.com', password: 123456)


puts "Seeding the office database"
ADDRESSES.each do |a|
  puts a
 office = Office.new(
   name: DESKS.sample,
   address: a,
   price: rand(50..1000),
   workspace_type: Faker::House.furniture,
   number_of_seats: rand(1..10)
   )
 office.user = User.find(rand(1..4))
 # office.remote_photo_url = "httsp.."
 office.save!
end
puts "Created 4 users, Office database seeded with 20 offices"

