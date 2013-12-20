class Tag
  include Mongoid::Document
  field :name, type: String

  embedded_in :post
end
