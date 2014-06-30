require 'spec_helper'

describe GistsController do
  describe "routing" do
    it "routes to gist show page" do
      get("/gists/dingnan/gist_alias.html").should route_to("gists#show", :user => "dingnan", :alias => "gist_alias", :format => "html")
    end
    
    it "routes to gist's snippet raw page" do
      get("/gists/gist_id/raw/snippet_id/example.cpp").should route_to("gists#raw", :id => "gist_id", :snippet_id => "snippet_id", :filename => "example", :format => "cpp")
    end
  end
end
