class WallpapersController < ApplicationController
  def index
    @wallpapers = Wallpaper.page(params[:page]).per(1)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @wallpapers }
    end
  end
end
