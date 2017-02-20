require 'rails_helper'

describe UsersController do 
  let!(:user) { User.create!(name: "Zara", username: "zarazara", password: "password", games_played: 10) }
  let!(:game) { Game.create!(word: "sandwich", user_id: user.id) }

  describe "GET #users" do
    it "responds with status code 200" do 
      get :index
      expect(response).to have_http_status(200)
    end  

    it "assigns the users where games_played is greater than 0 to @users" do 
      get :index
      expect(assigns(:users)).to match_array([user])
    end 

    it "renders the :index template" do 
      get :index
      expect(response).to render_template(:index)
    end 
  end 

  describe "GET #new" do 
    it "responds with status code 200" do 
      get :new
      expect(response).to have_http_status(200)
    end 

    it "assigns a new user to @current_user" do 
      get :new
      expect(assigns(:current_user)).to be_a_new User
    end 

    it "renders the :new template" do 
      get :new
      expect(response).to render_template(:new)
    end 
  end 

  describe "POST #create" do
    context "when valid params are passed" do 
      it "responds with status code 302" do 
        post :create, { user: { name: "Zara", username: "zarazara", password: "password", password_confirmation: "password" } }
        expect(response).to have_http_status(302)
      end 

      it "creates a new user in the database" do 
        expect{ post :create, { user: { name: "Zara", username: "zarazara", password: "password", password_confirmation: "password" } } }.to change(User, :count).by(1)
      end 

      it "assigns the newly created user as @current_user" do 
        post :create, { user: { name: "Zara", username: "zarazara", password: "password", password_confirmation: "password" } }
        expect(assigns(:current_user).name).to eq "Zara"
      end 

      it "redirects to the created user's profile page" do 
      post :create, { user: { name: "Zara", username: "zarazara", password: "password", password_confirmation: "password" } }
      expect(response).to redirect_to(user_path(user.id+1))
      end 
    end 

    context "when invalid params are passed" do 
      it "responds with status code 200" do 
        post :create, { user: { username: "zarazara", password: "password", password_confirmation: "password" } }
        expect(response).to have_http_status 200 
      end

      it "does noto create a new game in the database" do 
        expect{ post :create, { user: { username: "zarazara", password: "password", password_confirmation: "password" } } }.to change(User, :count).by(0)
      end 

      it "assigns the unsaved user as @current_user" do 
        post :create, { user: { username: "zarazara", password: "password", password_confirmation: "password" } }
        expect(assigns(:current_user).username).to eq "zarazara"
      end 

      it "renders the :new template" do 
        post :create, { user: { username: "zarazara", password: "password", password_confirmation: "password" } }
        expect(response).to render_template(:new)
      end 
    end 
  end 
end 