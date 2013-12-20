class Post
  include Mongoid::Document
  field :title, type: String
  field :summary, type: String
  field :content, type: String

  embeds_many :tags
  has_one :category
  belongs_to :user
end
