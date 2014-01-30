class Wallpaper
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :url, type: String
  field :author, type: String
  field :copyright_link, type: String
end
