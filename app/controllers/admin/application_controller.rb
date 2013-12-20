class Admin::ApplicationController < ApplicationController
  layout 'admin'

  before_filter :init

  protected
  
  # 初始化控制器
  def init

  end
end
