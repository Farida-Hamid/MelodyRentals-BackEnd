# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movi
# user = User.create!(name: "selamawit", username: "selam", email: " sela@example.com", password: "123456", role: "admin")
user  = User.create!(name: "Meshu", username: "Meshu", email: "meshu@gmail.com", password: "123456", role: "admin")
instrument = Instrument.create!(name: "guitar", description: "guitargxdytgxfrydh", image: "guitaruetsgdrfhcvgjbzwryxetc", category: "guitarszgxdctfv", price: 100, quantity: 10, user_id: user.id)
