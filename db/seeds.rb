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
    available: true,
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

#   Character.create(name: "Luke", movie: movi
# user = User.create!(name: "selamawit", username: "selam", email: " sela@example.com", password: "123456", role: "admin")
user  = User.create!(name: "Meshu", username: "Meshu", email: "meshu@gmail.com", password: "123456", password_confirmation: "123456", role: "admin")
instrument = Instrument.create!(name: "guitar", description: "guitargxdytgxfrydh", image: "guitaruetsgdrfhcvgjbzwryxetc", category: "guitarszgxdctfv", price: 100, user_id: user.id, available: true)


# user = User.create!(name: "selamawit", username: "selam", email: "selam@example", password: "123456", role: "admin")
# instrument = Instrument.create!(name: "guitar", description: "guitargxdytgxfrydh", image: "guitaruetsgdrfhcvgjbzwryxetc", category: "guitarszgxdctfv", price: 100, user_id: user.id, available: true)
# reservation = Reservation.create!(instrument_id: instrument.id, user_id: user.id, pickup_date: "2023-05-01", return_date: "2023-05-05")

