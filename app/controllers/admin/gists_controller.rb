class Admin::GistsController < Admin::ApplicationController
  def index
    @gists = Gist.where(user: current_user).page(params[:page])
  end

  def new
    @gist = Gist.new
    @gist.snippets.build
  end

  def create
    params.permit!
    @gist = Gist.new(params[:gist])
    @gist.user = current_user
    if @gist.save()
      redirect_to admin_gists_path
    else
      render action: 'new'
    end
  end

  def edit
    @gist = Gist.find(params[:id])
  end

  def update
    @gist = Gist.find(params[:id])
    @gist.user = current_user
    params.permit!
    if @gist.update_attributes(params[:gist])
      redirect_to admin_gists_path
    else
      render action: 'edit'
    end
  end

  def destroy
    Gist.find(params[:id]).delete()
    redirect_to admin_gists_path
  end
end
