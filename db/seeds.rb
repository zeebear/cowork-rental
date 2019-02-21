LIMERICKS = [
'*** JavaScript was made for the masses,',
'*** It lacked types, and modules, and classes.',
'*** But it became giant, ran on server and client,',
'*** \'Til it crashed both, despite 100 test passes.',
'*** Then came the wind to our sails,',
'*** In a language that every hipster hails.',
'*** Its name was Ruby, it made an expert from a newbie,',
'*** \'Til it got traffic and fell off the rails.'
]

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
'There were dogs barking outside the whole time. I couldn\'t concentrate',
'Where was the coffee? It was listed in the facilities, but there wasn\'t any',
'This site is illegal and should be shut down',
'Can I rent this space for a longer time?',
'The owner never responds to any of my reviews',
'This was the best space I could find, but it wasn\'t great',
'Can I get a discount if I book this space for more than half a year?'
'hello',
'h',
'Had to bring my own utensils, there were none in the kitchen'
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
'2018-12-11',
'2018-12-03',
'2018-12-11',
'2018-11-22',
'2018-12-25',
'2018-12-24',
'2018-12-16'
]

END_DATES = [
'2018-01-11',
'2018-01-12',
'2018-01-13',
'2018-01-14',
'2018-01-15',
'2018-01-16'
]

puts "Creating 4 users"
User.create(email: 'claire@claire.com', password: 123456)
User.create(email: 'alfonso@alfonso.com', password: 123456)
User.create(email: 'bill@bill.com', password: 123456)
User.create(email: 'mati@mati.com', password: 123456)


puts "Seeding the office database"
ADDRESSES.first(8).each_with_index do |a, i|
  puts "Creating #{i + 1} / 8 offices…"
  puts LIMERICKS[i]
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
5.times do
  b = Booking.new(
    start_date: START_DATES.sample,
    end_date: END_DATES.sample
    )
  b.office = Office.find(rand(1..8))
  b.user = User.find(rand(1..4))
  b.save!
end

puts "Seeding the reviews database"
REVIEWS.each do |review|
  r = Review.new(
    rating: rand(1..5),
    content: review
    )
  r.booking = Booking.find(rand(1..5))
  r.save!
end
puts "***"
puts "Ready to rock'n'roll! Restart your server, refresh your browser!"
puts "***"
