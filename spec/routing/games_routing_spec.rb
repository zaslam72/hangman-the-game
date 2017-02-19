require "rails_helper"

RSpec.describe "Routing to games", type: :routing do 
  it "routes GET /games/new to games#new" do 
    expect(get: "/games/new").to route_to("games#new")
  end 

  it "routes GET /games/1 to game#show" do 
    expect(get: "/games/1").to route_to("games#show", id: "1")
  end 

  it "routes POST /games to games#create" do 
    expect(post: "/games").to route_to("games#create")
  end 

  it "routes GET /games/1/edit to games#edit" do 
    expect(get: "/games/1/edit").to route_to("games#edit", id: "1")
  end 

  it "routes PUT /games/1 to games#update" do 
    expect(put: "/games/1").to route_to("games#update", id: "1")
  end 

    it "routes PATCH /games/1 to games#update" do 
    expect(patch: "/games/1").to route_to("games#update", id: "1")
  end 

  it "routes DELETE /games/1 to games#destroy" do 
    expect(delete: "/games/1").to route_to("games#destroy", id: "1")
  end 


end 