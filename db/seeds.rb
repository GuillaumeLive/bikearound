# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Bike.destroy_all

Bike.create!(
  name: "Rockrider 201",
  description: "XL size and red color",
  price: "40",
  localization: "Lille"
)

Bike.create!(
  name: "Btwin 3",
  description: "XXL size and red color",
  price: "30",
  localization: "Lille Fives"
)

puts "Finished!"
