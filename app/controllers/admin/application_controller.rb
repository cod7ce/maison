class Admin::ApplicationController < ApplicationController
  # 加载管理界面模版
  layout 'admin'

  include Admin::ApplicationHelper

  # 后台控制器的初始化操作
  before_filter :init
  before_filter :check_auth
  
  protected
  # 初始化控制器
  def init
  end

  # 检查权限
  def check_auth
    if !current_user && params[:controller]!='admin/sessions'
      redirect_to admin_login_url
    end
  end
end
