require 'rails_helper'

describe SessionsController do 
  let!(:user) { User.create!(name: "Zara", username: "zarazara", password: "password", games_played: 10) }

  describe "GET #new" do 
    it "responds with status code 200" do 
      get :new
      expect(response).to have_http_status(200)
    end 

    it "renders the :new template" do 
      get :new
      expect(response).to render_template(:new)
    end 
  end 
end 