class Category
  include Mongoid::Document
  field :name, type: String
  field :code, type: String

  belongs_to :post
end
