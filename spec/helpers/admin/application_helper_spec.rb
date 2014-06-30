require 'spec_helper'

describe ApplicationHelper do

  describe 'current user' do
    let(:user) { create(:user) }
    it "should be nil obj when user not login" do
      helper.current_user.should be_nil
    end
    it "should be user when user has login" do
      session[:user_id] = user.id
      helper.current_user.should == user
    end
  end

end
