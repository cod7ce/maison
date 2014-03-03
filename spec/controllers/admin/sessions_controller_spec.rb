require 'spec_helper'

describe Admin::SessionsController do
  describe ':new' do
    it "should have new action" do
      get :new
      response.should be_success
    end
  end

  describe ':create' do
    let(:user) { create(:user) }

    it "should login success with correct info" do
      post :create, :user => { :email => user.email, :password => user.password }
      response.should redirect_to(admin_root_path)
    end

    it "should login failure with error info" do
      post :create, :user => { :email => user.email, :password => "error_info" }
      response.should render_template(:new)
    end
  end
  
  describe ':destroy' do
    it 'should have destroy action' do
      get :destroy
      response.should redirect_to(admin_login_path)
    end
  end
end
