# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(
  name: "Admin",
  username: "admin",
  email: "admin@localhost",
  password: "password",
  password_confirmation: "password",
  role: "admin",
)

3.times do |n|
  Instrument.create!(
    name: Faker::Music.instrument,
    description: Faker::Lorem.paragraph,
    image: Faker::LoremFlickr.image(size: "300x300", search_terms: ["music"]),
    price: Faker::Commerce.price(range: 10..100),
    quantity: Faker::Number.between(from: 1, to: 100),
    category: "guitar",
    user_id: 1,
  )
end

3.times do |n|
  User.create!(
    name: Faker::Name.name,
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    role: "regular",
  )
end
