class WallpapersController < ApplicationController
  def index
    @page = params[:page] ? params[:page].try('to_i') : 1;
    @count = Wallpaper.count
    @wallpapers = Wallpaper.page(@page).per(1)
  end
end
