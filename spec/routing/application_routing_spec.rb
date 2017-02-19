require "rails_helper"

RSpec.describe "Routing to the application", :type => :routing do 
  it "GET / route to welcome#index" do 
    expect(:get => "/").to route_to("welcome#index")
  end 

end 