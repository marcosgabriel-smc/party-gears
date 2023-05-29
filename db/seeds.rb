# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning the users table...'
User.destroy_all

puts 'Creating 3 users...'
User.create!(
  name: 'meleu',
  email: 'meleu@rbnb.com',
  password: 'asdfgçlkjh'
)
User.create!(
  name: 'marcos',
  email: 'marcos@rbnb.com',
  password: 'asdfgçlkjh'
)
User.create!(
  name: 'douglas',
  email: 'douglas@rbnb.com',
  password: 'asdfgçlkjh'
)

puts 'Cleaning the gears table...'
Gear.destroy_all

puts "Creating some gears"
10.times do
  Gear.create!(
    category: Gear::CATEGORIES.sample,
    name: Faker::App.name,
    description: Faker::Quote.famous_last_words,
    user: User.all.sample,
    price: rand(50..500)
  )
end

puts 'Finished!'
