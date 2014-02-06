class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
    set_seo_meta('文章')
  end

  def show
    @post = Post.find(params[:id])
    set_seo_meta(@post.title, @post.keywords, @post.summary)
  end
end
