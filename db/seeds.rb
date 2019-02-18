# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Office.destroy_all
User.destroy_all

owner = User.new(email: 'mati@gmail.com', password: 123456)
owner.save

worker = User.new(email: 'worker@gmail.com', password: 123456)
worker.save

office = Office.new(user: owner, name: 'La Maquinita Co', price: 150, number_of_seats: 1, workspace_type: 'desk')
office.save
