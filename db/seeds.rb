# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require "open-uri"

file1 = URI.open('https://www.orangebikes.co.uk/images/2017_bikes/jpegs/324_Factory_3Q_2017-101.jpg')
file2 = URI.open('https://p.vitalbmx.com/photos/products/9716/photos/17811/s1600_nagas_org.jpg?1449257146')
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Bike.destroy_all
User.destroy_all


puts "creating users..."
user = User.create!(
  name: "Paul Jack",
  email: "pauljack@gmail.com",
  password: "azerty")

puts "creating bikes..."
bike_1 = Bike.new(
  user: user,
  name: "Rockrider 201",
  description: "XL size and red color",
  price: "40",
  localization: "Lille"
)
bike_1.photo.attach(io: file1, filename: 'bike.png', content_type: 'image/png')
bike_1.save!
bike_2 = Bike.new(
  user: user,
  name: "Btwin 3",
  description: "XXL size and red color",
  price: "30",
  localization: "Lille Fives"
)
bike_2.photo.attach(io: file2, filename: 'bike2.png', content_type: 'image/png')
bike_2.save!
puts "Finished!"
