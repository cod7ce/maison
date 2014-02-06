class HomeController < ApplicationController
  def index
  end

  def about
    set_seo_meta('简历')
  end
end
