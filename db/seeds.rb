# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting existing restos and reviews"
Review.destroy_all
Restaurant.destroy_all

puts "creating categories"
categories = ['chinese', 'italian', 'japanese', 'french', 'belgian']

puts "creatng restos and reviews"
10.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number,
    category: categories.sample
  )
  rand(3..5).times do
    review = Review.create(
      rating: rand(0..5),
      content: Faker::Hipster.sentence,
      restaurant: restaurant
    )
  end
end
