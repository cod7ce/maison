class Post
  include Mongoid::Document
  field :title, type: String
  field :summary, type: String
  field :content, type: String
  field :tags, type: Array

  belongs_to :category
  belongs_to :user

  def construire_post(params)
    self.tags = Array.new
    params[:tags].split(',').each do |tag|
      self.tags << tag
    end
    self.title = params[:title]
    self.summary = params[:summary]
    self.content = params[:content]
    self.category = Category.find(params[:category])
  end
end
