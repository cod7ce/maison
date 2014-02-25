class Wallpaper
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :author, type: String
  field :copyright_link, type: String

  mount_uploader :picture, WallpaperUploader

  default_scope desc(:created_at)

end
