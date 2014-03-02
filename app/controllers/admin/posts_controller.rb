class Admin::PostsController < Admin::ApplicationController 
  before_filter :find_post, :only => [:edit, :update, :destroy]

  def index
    @posts = Post.where(user: current_user).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save()
      redirect_to admin_posts_path
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to admin_posts_path
    else
      render action: 'edit'
    end
  end

  def destroy 
    @post.delete()
    redirect_to admin_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :alias, :summary, :category_id, :tag_list, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
