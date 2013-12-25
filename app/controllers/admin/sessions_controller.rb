class Admin::SessionsController < ApplicationController
  def new
    @user = User.new
    render :layout => 'login'
  end

  def create
  end

  def destroy
  end
end
