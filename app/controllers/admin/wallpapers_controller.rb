class Admin::WallpapersController < Admin::ApplicationController
  def index
    @wallpapers = Wallpaper.page(params[:page])
  end

  def new
    @wallpaper = Wallpaper.new
  end

  def create
    @wallpaper = Wallpaper.new
    @wallpaper.name = params[:wallpaper][:name]
    @wallpaper.picture = params[:wallpaper][:picture]
    @wallpaper.author = params[:wallpaper][:author]
    @wallpaper.copyright_link = params[:wallpaper][:copyright_link]
    if @wallpaper.save
      redirect_to admin_wallpapers_path
    else
      render :action => 'new'
    end
  end

  def edit
    @wallpaper = Wallpaper.find(params[:id])
  end

  def update
    @wallpaper = Wallpaper.find(params[:id])
    @wallpaper.name = params[:wallpaper][:name]
    @wallpaper.picture = params[:wallpaper][:picture] if params[:wallpaper][:picture]
    @wallpaper.author = params[:wallpaper][:author]
    @wallpaper.copyright_link = params[:wallpaper][:copyright_link]
    if @wallpaper.update
      redirect_to admin_wallpapers_path
    else
      render :action => 'edit'
    end
    
  end

  def destroy
    @wallpaper = Wallpaper.find(params[:id])
    @wallpaper.delete
    redirect_to admin_wallpapers_path
  end
end
