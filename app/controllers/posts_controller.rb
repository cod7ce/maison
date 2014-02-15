class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
    set_seo_meta('文章')
  end

  def show
    # @post = Post.where(:user_id.in => User.where(name: params[:user]).distinct(:_id), :alias => params[:alias]).first
    @post = Post.where(:user_id => User.where(name: params[:user]).first.id, :alias => params[:alias]).first
    set_seo_meta(@post.title, @post.keywords, @post.summary)
  end
end
