require 'spec_helper'

describe Admin::HomeController do
  let!(:user) { create(:user) }
  before { session[:user_id] = user.id }
  
  describe ':index' do
    it "should have index action" do
      get :index
      response.should be_success
    end
  end
end
