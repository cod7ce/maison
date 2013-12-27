class Admin::SessionsController < ApplicationController
  def new
    @user = User.new
    render :layout => 'login'
  end

  def create
    @user = User.new()
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]

    if @user.auth?
      session[:user_id] = @user.id
      redirect_to admin_posts_path
    else
      render :action => 'new', :layout => 'login'
    end
  end

  def destroy
    reset_session
    redirect_to admin_login_path
  end
end
