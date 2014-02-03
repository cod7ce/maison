class Admin::GistsController < Admin::ApplicationController
  def index
    @gists = Gist.page(params[:page])
  end

  def new
    @gist = Gist.new
    @gist.snippets.build
  end
end
