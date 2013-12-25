# encoding: utf-8
module Admin::ApplicationHelper

  # 获取当前用户
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # 用户是否已登录
  def user_sign_in?
    return true if current_user
  end

end
