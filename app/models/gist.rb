class Gist
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String

  belongs_to :user
  embeds_many :snippets
  accepts_nested_attributes_for :snippets
end
