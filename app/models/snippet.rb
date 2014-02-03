class Snippet
  include Mongoid::Document
  field :filename, type: String
  field :language, type: String
  field :code, type: String

  embedded_in :gist
end
