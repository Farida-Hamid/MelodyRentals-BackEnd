require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "will not display users unless signed in" do
      get api_v1_users_path
      expect(response).to have_http_status(401)
    end
  end
end