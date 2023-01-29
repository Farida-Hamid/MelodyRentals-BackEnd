require 'rails_helper'

RSpec.describe Instrument, type: :model do
  before(:each) do
    @user = User.create!(name: 'person', username: 'person', email: 'person@localhost', password: 'password',
                         password_confirmation: 'password', role: 'admin')
    @instrument = Instrument.create!(name: 'Test Instrument', description: 'Test Description', image: 'Test Image',
                                     category: 'Test Category', price: 100, user_id: @user.id, available: true)
  end

  it 'is valid with valid attributes' do
    expect(@instrument).to be_valid
  end

  it 'is not valid without a name' do
    @instrument.name = nil
    expect(@instrument).to_not be_valid
  end

  it 'is only created by user' do
    @instrument.user_id = nil
    expect(@instrument).to_not be_valid
  end
end
