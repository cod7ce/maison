class Admin::GistsController < Admin::ApplicationController
  def index
    @gists = Gist.page(params[:page])
  end

  def new
    @gist = Gist.new
    @gist.snippets.build
  end

  def create
    params.permit!
    @gist = Gist.new(params[:gist])
    @gist.save()
  end

  def edit
    @gist = Gist.find(params[:id])
  end

  def update
    @gist = Gist.find(params[:id])
    params.permit!
    if @gist.update_attributes(params[:gist])
      redirect_to admin_gists_path
    else
      render action: 'edit'
    end
  end
end
