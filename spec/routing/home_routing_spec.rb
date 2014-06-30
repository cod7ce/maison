require 'spec_helper'

describe HomeController do
  describe "routing" do
    it "routes to root" do
      get("/").should route_to("home#index")
    end

    it "routes to about" do
      get("/about").should route_to("home#about")
    end
  end
end
