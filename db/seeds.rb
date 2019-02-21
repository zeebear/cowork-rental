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
REVIEWS = [
'Comfortable space, but the wifi was slow',
'I loved it! And the coffee was great. Thumbs up, I\'ll be back again!',
'Reasonable facilities for the price',
'The owner was a joy to deal with, and everything was as advertised',
'Very noisy environment. The kitchen was a bit dirty.',
'This desk is not comfortable for short people',
'Great location, reasonable price. It was easy to arrange to get in to the space. The wifi is very fast!!!!',
'Furniture a bit worn, but otherwise fine',
'The space is great, but it was impossible to find parking in the neighbourhood',
'Could be cleaner.',
'Everything worked as expected',
'Fast wifi, good coffee, comfortable space. I\'ll be back for sure!',
]

IMAGES = [
Rails.root.join("db/offices/adult-agency-business-380769.jpg").open,
Rails.root.join("db/offices/adult-beard-business-845451.jpg").open,
Rails.root.join("db/offices/adult-bookcase-business-218413.jpg").open,
Rails.root.join("db/offices/adult-business-daylight-374085.jpg").open,
Rails.root.join("db/offices/adult-businessman-computer-374598.jpg").open,
Rails.root.join("db/offices/ai-artificial-intelligence-automation-1329068.jpg").open,
Rails.root.join("db/offices/alex-kotliarskyi-361081-unsplash.jpg").open,
Rails.root.join("db/offices/american-coffee-colleagues-1389122.jpg").open,
Rails.root.join("db/offices/andrew-neel-218073-unsplash.jpg").open,
Rails.root.join("db/offices/annie-spratt-294450-unsplash.jpg").open,
Rails.root.join("db/offices/annie-spratt-439326-unsplash.jpg").open,
Rails.root.join("db/offices/apartment-architecture-business-221537.jpg").open,
Rails.root.join("db/offices/apartment-architecture-business-265129.jpg").open,
Rails.root.join("db/offices/architectural-design-architecture-ceiling-380768.jpg").open,
Rails.root.join("db/offices/architecture-book-shelves-bookcase-245240.jpg").open,
Rails.root.join("db/offices/art-business-cactus-265101.jpg").open,
Rails.root.join("db/offices/black-and-white-black-and-white-chair-81363.jpg").open,
Rails.root.join("db/offices/black-and-white-board-boardroom-260689.jpg").open,
Rails.root.join("db/offices/bookcase-chair-computer-263209.jpg").open,
Rails.root.join("db/offices/brainstorming-collaborate-collaboration-1204649.jpg").open,
]

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
    'Desk in a private office',
    'Desk in a shared space',
    'Table in a shared space',
    'Table for 6 in a shared office'
]

START_DATES = [
2018-12-11,
2018-12-03,
2018-12-11,
2018-11-22,
2018-12-25,
2018-12-24,
2018-12-16
]

END_DATES = [
2018-01-11,
2018-01-12,
2018-01-13,
2018-01-14,
2018-01-15,
2018-01-16
]

puts "Creating 4 users"
User.create(email: 'claire@claire.com', password: 123456)
User.create(email: 'alfonso@alfonso.com', password: 123456)
User.create(email: 'bill@bill.com', password: 123456)
User.create(email: 'mati@mati.com', password: 123456)


puts "Seeding the office database"
ADDRESSES.first(8).each_with_index do |a, i|
  puts "Creating #{i + 1} / 8 offices…"
 office = Office.new(
   name: DESKS.sample,
   address: a,
   price: rand(50..1000),
   workspace_type: Faker::House.furniture,
   number_of_seats: rand(1..10),
   photo:  IMAGES[i]
   )
 office.user = User.find(rand(1..4))
 # office.remote_photo_url = "httsp.."
 office.save!
end
puts "Created 4 users. Office database seeded with 20 offices"

puts "Seeding the bookings database"
5.times do |variable|
  b = Booking.new(
    start_date: START_DATES.rand
    end_date: END_DATES.rand
    )
  b.office = Office.find(rand(1..8))
  b.user = User.find(rand(1..4))
  b.save!
end

