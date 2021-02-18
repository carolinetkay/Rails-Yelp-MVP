# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Let\'s start seeding!'

puts 'Cleaning database...'
Restaurant.destroy_all

5.times do
  puts 'Creating restaurants...'
  resto = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: %w[chinese italian japanese french belgian].sample,
    phone_number: Faker::Number.number(digits: 10).to_s
  )
end

puts 'Finished! Let\'s go...'

