# to create users, run the following in the rails console:
# User.create!(name: 'Regular User', username: 'regular', email: 'password' 'password', password_confirmation: 'password', role: 'user')

# to create instruments, run the following in the rails console:
# Instrument.create!(name: 'chello', category: 'string', description: 'a chello', price: 1000, quantity: 10, user_id: 1, image: 'https://images.unsplash.com/photo123.png')

# to create reservations, run the following in the rails console:
# Reservation.create!(pickup_date: '2020-01-01', return_date: '2020-01-02', user_id: 1, instrument_id: 1)

ser.create!(name: 'Admin User', username: 'admin', email: 'admin@mail.com', password: 'password', password_confirmation: 'password', role: 'admin')
