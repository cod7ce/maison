class WallpapersController < ApplicationController
  def index
    @page = params[:page] ? params[:page].try('to_i') : 1;
    @count = Wallpaper.count
    @wallpaper = Wallpaper.page(@page).per(1).first
  end
end
