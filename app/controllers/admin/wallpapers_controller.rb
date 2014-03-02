class Admin::WallpapersController < Admin::ApplicationController
  before_filter :find_wallpaper, :only => [:edit, :update, :destroy]

  def index
    @wallpapers = Wallpaper.page(params[:page])
  end

  def new
    @wallpaper = Wallpaper.new
  end

  def create
    @wallpaper = Wallpaper.new(wallpaper_params)
    if @wallpaper.save
      redirect_to admin_wallpapers_path
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @wallpaper.update_attributes(wallpaper_params)
      redirect_to admin_wallpapers_path
    else
      render :action => 'edit'
    end
    
  end

  def destroy
    @wallpaper.delete
    redirect_to admin_wallpapers_path
  end

  private
  def wallpaper_params
    params.require(:wallpaper).permit(:name, :picture, :author, :copyright_link)
  end

  def find_wallpaper
    @wallpaper = Wallpaper.find(params[:id])
  end
end
