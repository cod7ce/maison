class WallpapersController < ApplicationController
  def index
    @page = params[:page] ? params[:page] : '1';
    @count = Wallpaper.count
    @wallpapers = Wallpaper.page(@page).per(1)
  end
end
