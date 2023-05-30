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

images = {
  'dj' => 'https://img2.gratispng.com/20180604/kkz/kisspng-cdj-2000-disc-jockey-dj-mixer-pioneer-djm-900-nexu-dj-turntables-5b15d5aa375908.1170706315281576102267.jpg',
  'sound' => 'https://images.unsplash.com/photo-1620456175552-c82581ade74e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80',
  'lighting' => 'https://sb7someluz.com.br/wp-content/uploads/2015/04/Profissionais-do-Ano-06.jpg'
}

puts 'Cleaning the gears table...'
Gear.destroy_all

puts "Creating some gears"
10.times do
  category = Gear::CATEGORIES.sample

  Gear.create!(
    category:,
    name: Faker::App.name,
    description: Faker::Quote.famous_last_words,
    user: User.all.sample,
    image_url: images[category],
    price: rand(50..500)
  )
end

puts 'Finished!'
