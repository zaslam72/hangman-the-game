require 'rails_helper'

RSpec.describe User, type: :model do 
  
  let(:user) { User.create(name: "Zara", username: "zarazara", password: "password", password_confirmation: "password") }
  let(:user2) { User.create(username: "joejoe", password: "password", password_confirmation: "password") }
  let(:user3) { User.create(name: "Joe", password: "password", password_confirmation: "password") }
  let(:user4) { User.create(name: "Joe", username: "joejoe") }
  let(:user5) { User.create(name: "Jess", username: "jessjess", password: "password", password_confirmation: "password") }

  let(:game) { Game.create(word: "sandwich", user_id: user.id) }

  describe "user attributes" do 

    it "has a name" do
      expect(user.name).to eq "Zara"
    end 

    it "has a username" do 
      expect(user.username).to eq "zarazara"
    end 

    it "has a password" do 
      expect(user.password_digest).not_to eq "password" 
    end 

    it "validates presence of a name" do 
      expect(user2.id).to eq nil
    end 

    it "validates presence of a username" do 
      expect(user3.id).to eq nil 
    end 

    it "validates presence of a password" do
      users = User.all
      expect(users).to eq [user]
    end 

    it "sets association that user has many games" do 
      expect(user.games).to eq [game]
    end 

  end 

end 