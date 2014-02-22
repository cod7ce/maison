class Category
  include Mongoid::Document
  field :name, type: String
  field :code, type: String

  has_many :posts

  default_scope desc(:name)

  validates_presence_of :name, :code
  validates_uniqueness_of :code

end
