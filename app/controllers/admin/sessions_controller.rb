class Admin::SessionsController < ApplicationController
  def new
    @user = User.new
    render :layout => 'login'
  end

  def create
    @user = User.new(user_params)
    if @user.auth?
      session[:user_id] = @user.id
      redirect_to admin_root_path
    else
      render :action => 'new', :layout => 'login'
    end
  end

  def destroy
    reset_session
    redirect_to admin_login_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
