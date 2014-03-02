require 'spec_helper'

describe PostsController do
  describe "routing" do
    it "routes to post show page" do
      get("/posts/dingnan/post_alias.html").should route_to("posts#show", :user => "dingnan", :alias => "post_alias", :format => "html")
    end
  end
end
