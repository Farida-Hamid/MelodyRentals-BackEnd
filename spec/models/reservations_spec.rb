require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @user = User.create!(name: 'Test1 User', username: 'test1user', email: 'user1@example.com', password: 'password',
                         role: 'regular')
    @instrument = Instrument.create!(name: 'Test Instrument', description: 'Test Description', image: 'Test Image',
                                     category: 'Test Category', price: 100, user_id: @user.id, available: true)
    @reservation = Reservation.create!(user_id: @user.id, instrument_id: @instrument.id, pickup_date: Date.today,
                                       return_date: Date.today + 1)
  end

  it 'is valid with valid attributes' do
    expect(@reservation).to be_valid
  end

  it 'is not valid without a user_id' do
    @reservation.user_id = nil
    expect(@reservation).to_not be_valid
  end

  it 'is not valid without a instrument_id' do
    @reservation.instrument_id = nil
    expect(@reservation).to_not be_valid
  end

  it 'is not valid without a pickup_date' do
    @reservation.pickup_date = nil
    expect(@reservation).to_not be_valid
  end

  it 'is not valid without a return_date' do
    @reservation.return_date = nil
    expect(@reservation).to_not be_valid
  end

  it 'is not valid if return_date is before pickup_date' do
    @reservation.return_date = Date.today - 1
    expect(@reservation).to_not be_valid
  end

  it 'is not valid if return_date is the same as pickup_date' do
    @reservation.return_date = Date.today
    expect(@reservation).to_not be_valid
  end
end
