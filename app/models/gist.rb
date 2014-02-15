class Gist
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :summary, type: String
  field :tags, type: Array
  field :alias, type: String

  attr_accessor :tag_list
  def tag_list=(value)
    self.tags = value.split(',') if !value.blank?
  end

  def tag_list
    self.tags.try('join', ',')
  end

  attr_readonly :keywords
  def keywords
    "#{self.tag_list},#{self.title}"
  end

  belongs_to :user
  embeds_many :snippets
  accepts_nested_attributes_for :snippets, reject_if: lambda { |s| s[:filename].blank? }, allow_destroy: true
end
