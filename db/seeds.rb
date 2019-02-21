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
  'Armenia 1242, C1414DKB CABA',
  'Loyola 701, C1414AUO CABA',
  'Gorriti 4738, C1414BJL CABA',
  'Armenia 1641, 1414 CABA',
  'Malabia 1510, C1414 CABA',
  'Thames 1535, C1414 CABA',
  'Guatemala 4516, C1425BUJ CABA',
  'Charcas 3702, C1425BMZ CABA',
  'Guatemala 4699, C1425 CABA',
  'Av. Santa Fe 3856, C1425BHN CABA',
  'Thames 1891, C1414 CABA',
  'Honduras 4969, C1414BMO CABA',
  'Av. Córdoba 5267, C1414 CABA',
  'Serrano 1106, C1414DEX CABA',
  'Gorriti 5657, C1414BKE CABA',
  'Gorriti 5801, 1414 CABA',
  'Costa Rica 5527, C1414BTC CABA',
  'Humboldt 2000, C1414CTV CABA',
  'Humboldt 1892, C1414CTT CABA',
  'Humboldt 2192, C1425FUB CABA'
]

puts "Creating 4 users"
User.create(email: 'claire@claire.com', password: 123456)
User.create(email: 'alfonso@alfonso.com', password: 123456)
User.create(email: 'bill@bill.com', password: 123456)
User.create(email: 'mati@mati.com', password: 123456)


puts "Seeding the office database"
20.times do
 address = 0
 office = Office.new(
   name: Faker::Commerce.product_name
   address: ADDRESSES[address]
   price: rand(50..1000)
   workspace_type: Faker::House.unique.furniture
   number_of_seats: rand(1..10)
   )
 office.user =
 office.remote_photo_url = "httsp.."
 office.save!
 address += 1
end
puts "Office database seeded with 20 offices"

