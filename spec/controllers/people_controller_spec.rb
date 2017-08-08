require 'rails_helper'

RSpec.describe PeopleController, type: :controller do

  describe "GET /people" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template :index
    end
  end
end
