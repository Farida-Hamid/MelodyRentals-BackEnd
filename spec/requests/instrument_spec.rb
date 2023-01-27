require 'rails_helper'

RSpec.describe "Instruments", type: :request do

    let(:user) { build :user }
    let(:instrument) { build :instrument }
    FactoryBot.create(:instrument)
    FactorBot.create(:user)
    describe "GET /instruments" do
        it "returns all books" do
        get "/api/v1/instruments"
        expect(response).to have_http_status(200)
        expect(response.body).to eq(Instrument.all.to_json)
        expect(JSON.parse(response.body).size).to eq(Instrument.all.size)
        end
    end

    describe "GET /instruments/:id" do
        it "returns a instrument" do
        get "/api/v1/instruments/#{instrument.id}"
        expect(response).to have_http_status(200)
        expect(response.body).to have_content(Instrument.find(instrument.id).to_json)
        end
    end

    describe "POST /instruments" do
        it "creates a instrument" do
        post "/api/v1/instruments", params: { instrument: { name: instrument.name, description: instrument.description, image: instrument.image, price: instrument.price, available: instrument.available, category: instrument.category, user_id: instrument.user_id } }
        expect(response).to have_http_status(201)
        expect(response.body).to have_content(Instrument.last.to_json)
        end
    end

    describe "DELETE /instruments/:id" do
        it "deletes a instrument" do
        delete "/api/v1/instruments/#{instrument.id}"
        expect(response).to have_http_status(204)
        end
    end
end
