require 'rails_helper'

RSpec.describe 'Instruments', type: :request do
  before(:each) do
    @user = FactoryBot.create(:user, name: 'testing', username: 'testing', email: 'testing@mail.com', password: 'password', password_confirmation: 'password',
    role: 'admin')
    @instrument = FactoryBot.create(:instrument, name: 'trombone', category: 'percussion', image: 'image.png', user_id: @user.id,
                                                 price: 100, description: 'a trombone')

  
  end

  describe 'GET /instruments' do
    it 'returns all instruments' do
      get '/api/v1/instruments.json'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /instruments/:id' do
    it 'returns a instrument' do
      get api_v1_instrument_path(@instrument.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /instruments' do
    it 'only allows admin to create instruments' do
      post '/api/v1/instruments',
           params: { instrument: { name: 'instrument.name', description: 'instrument.description', image: 'instrument.image',
                                   price: 'instrument.price', category: 'instrument.category', user_id: @user.id } }
      expect(response).to have_http_status(401)
    end
  end

  describe 'DELETE /instruments/:id' do
    user = FactoryBot.create(:user, name: 'user7', username: 'user7', email: 'user7@mail.com', password: 'password', password_confirmation: 'password',
    role: 'regular')
    instrument = FactoryBot.create(:instrument, name: 'piano', category: 'keys', image: 'image.png',
                                                user_id: user.id, price: 100, available: true, description: 'a piano')
    it 'only allows admin to delete an instrument' do
      delete "/api/v1/instruments/#{instrument.id}"
      expect(response).to have_http_status(401)
    end
  end
end
