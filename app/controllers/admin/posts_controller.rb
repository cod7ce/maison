class Admin::PostsController < Admin::ApplicationController 
  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.construire_post(params[:post])
    if @post.save()
      redirect_to admin_posts_path
    else
      render action: 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @post.tags = @post.tags.join(',') if @post.tags
  end

  def update
    @post = Post.find(params[:id])
    @post.construire_post(params[:post])
    if (@post.update())
      redirect_to admin_posts_path
    else
      render action: 'edit'
    end
  end

  def destroy 
    @post = Post.find(params[:id]).delete()
    redirect_to admin_posts_path
  end
end
