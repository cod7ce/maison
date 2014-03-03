require 'spec_helper'

describe HomeController do
  describe ':index' do
    it "should have index action" do
      get :index
      response.should be_success
    end
  end

  describe ':about' do
    it "should have about action" do
      get :about
      response.should be_success
    end
  end
end
