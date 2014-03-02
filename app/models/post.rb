class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :summary, type: String
  field :content, type: String
  field :tags, type: Array
  field :alias, type: String

  default_scope desc(:created_at)

  validates_presence_of :title, :content, :alias
  validates_uniqueness_of :alias

  attr_accessor :tag_list
  def tag_list=(value)
    self.tags = value.split(',') if !value.blank?
  end

  def tag_list
    self.tags.try('join', ',')
  end

  attr_readonly :keywords
  def keywords
    "#{self.tag_list},#{self.category.name},#{self.title}"
  end

  belongs_to :category
  belongs_to :user
end
