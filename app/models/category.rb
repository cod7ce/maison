class Category
  include Mongoid::Document
  field :name, type: String
  field :code, type: String

  has_many :posts
end
