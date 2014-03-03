require 'spec_helper'

describe PostsController do
  let(:post) { create(:post) }

  describe ':index' do
    it "should have index action" do
      get :index
      response.should be_success
    end
  end

  describe ':show' do
    it "should show post" do
      get :show, :user => post.user.name, :alias => post.alias
      response.should be_success
    end
  end
end
