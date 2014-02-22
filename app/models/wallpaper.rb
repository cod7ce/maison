class Wallpaper
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :url, type: String
  field :author, type: String
  field :copyright_link, type: String

  default_scope desc(:created_at)

  validates_presence_of :url
  validates_uniqueness_of :url
end
