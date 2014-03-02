require 'spec_helper'
require 'digest/md5'

describe User do
  describe "password" do 
    it "should generate crypted_password when user save" do
      user = User.create(email: 'apple@zhifangzi.com', password: 'zhifangzi', password_salt: 'salt', name: 'dingnan')
      user.crypted_password.should == Digest::SHA2.hexdigest("zhifangzi" + "salt")
    end
  end

  describe "auth?" do
    let( :user ) { create(:user) }
    
    it "have no errors when use corrent info" do
      user.should be_auth
    end
    
    it "have email error when use invalid email" do
      user.email = "invalid@email.com"
      user.auth?
      user.errors.should have_key(:email)
    end

    it "have password error when use invalid password" do
      user.password = "invalid_password"
      user.auth?
      user.errors.should have_key(:password)
    end
  end
end
