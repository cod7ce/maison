class WallpapersController < ApplicationController
  def index
    @page = params[:page] ? params[:page].try('to_i') : 1;
    @count = Wallpaper.count
    @wallpaper = Wallpaper.page(@page).per(1).first
  end

  def picture
    wallpaper = Wallpaper.find(params[:id])
    content = wallpaper.picture.read
    if stale?(etag: content, last_modified: wallpaper.updated_at.utc, public: true)
      send_data content, type: wallpaper.picture.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

  def thumb_picture
    wallpaper = Wallpaper.find(params[:id])
    content = wallpaper.picture.versions[:thumb].read
    if stale?(etag: content, last_modified: wallpaper.updated_at.utc, public: true)
      send_data content, type: wallpaper.picture.versions[:thumb].file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end
end
