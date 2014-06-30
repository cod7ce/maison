require 'spec_helper'

describe Admin::SessionsController do
  describe "routing" do
    it "routes to login page" do
      get("/admin/login").should route_to("admin/sessions#new")
    end

    it "routes to post login data" do
      post("/admin/login").should route_to("admin/sessions#create")
    end

    it "routes to logout" do
      get("admin/logout").should route_to("admin/sessions#destroy")
    end
  end
end
