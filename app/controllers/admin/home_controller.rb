class Admin::HomeController < Admin::ApplicationController
  def index
    @user = current_user
  end
end
