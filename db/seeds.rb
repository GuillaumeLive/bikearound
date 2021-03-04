# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require "open-uri"

file1 = URI.open('https://1.bp.blogspot.com/-il2C6vR9FCs/UKsOP5BOPZI/AAAAAAAABDs/Zw9xCFomVko/s1600/2620-paseo+2.JPG')
file2 = URI.open('https://www.becycled.be/files/03-2021/ad35488/gazelle-stadsfietsen-1623870779_orig.jpg')
file3 = URI.open('https://s3-us-west-2.amazonaws.com/usedphotosna/96352038_934.jpg')
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Booking.destroy_all
Bike.destroy_all
User.destroy_all


puts "creating users..."
user = User.create!(
  name: "Paul Jack",
  email: "pauljack@gmail.com",
  password: "azerty")

puts "creating bikes..."
puts "First one..."
bike_1 = Bike.new(
  user: user,
  name: "Paseo Vintage Bike",
  category: 'City bike',
  size: 'Woman',
  description: "Beautiful japanese vintage city bike !",
  price: "30",
  localization: "Lambersart"
)
bike_1.photo.attach(io: file1, filename: 'bike.png', content_type: 'image/png')
bike_1.save!
puts "Second one..."
bike_2 = Bike.new(
  user: user,
  name: "Gazelle Stadsfietsen",
  category: 'City bike',
  size: 'Man',
  description: "City 7-speed bike, very good state.",
  price: "40",
  localization: "Lille"
)
bike_2.photo.attach(io: file2, filename: 'bike2.png', content_type: 'image/png')
bike_2.save!
puts "Last one..."
bike_3 = Bike.new(
  user: user,
  name: "Schwinn Electric Bike",
  category: 'VTT',
  size: 'Man',
  description: "Electric bike with new brand battery 2018.",
  price: "50",
  localization: "Roubaix"
)
bike_3.photo.attach(io: file3, filename: 'bike3.png', content_type: 'image/png')
bike_3.save!
puts "Finished!"
