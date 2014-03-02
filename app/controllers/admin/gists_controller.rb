class Admin::GistsController < Admin::ApplicationController
  before_filter :find_gist, :only => [:edit, :update, :destroy]

  def index
    @gists = Gist.where(user: current_user).page(params[:page])
  end

  def new
    @gist = Gist.new
    @gist.snippets.build
  end

  def create
    @gist = Gist.new(gist_params)
    @gist.user = current_user
    if @gist.save()
      redirect_to admin_gists_path
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @gist.update_attributes(gist_params)
      redirect_to admin_gists_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @gist.delete()
    redirect_to admin_gists_path
  end

  private
  def gist_params
    params.require(:gist).permit(:title, :alias, :tag_list, :summary, snippets_attributes: [:id, :filename, :language, :code, :_destroy])
  end

  def find_gist
    @gist = Gist.find(params[:id])
  end
end
