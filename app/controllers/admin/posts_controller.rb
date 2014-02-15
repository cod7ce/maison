class Admin::PostsController < Admin::ApplicationController 
  def index
    @posts = Post.where(user: current_user).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.construire_post(params[:post])
    @post.user = current_user
    if @post.save()
      redirect_to admin_posts_path
    else
      render action: 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.construire_post(params[:post])
    if @post.update
      redirect_to admin_posts_path
    else
      render action: 'edit'
    end
  end

  def destroy 
    Post.find(params[:id]).delete()
    redirect_to admin_posts_path
  end
end
