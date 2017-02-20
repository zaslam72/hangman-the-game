require 'rails_helper'

RSpec.describe Friendship, type: :model do 
  
  let(:user) { User.create(name: "Zara", username: "zarazara", password: "password") }
  let(:user2) { User.create(name: "Joe", username: "joejoe", password: "password") }

  let(:friendship) { Friendship.create(user_id: user.id, friend_id: user2.id) }

  describe "friendship attributes" do 

    it "belongs to a user" do
      expect(friendship.user).to eq user
    end 

    it "belongs to a friend" do 
      expect(friendship.friend).to eq user2
    end 

  end 

end 