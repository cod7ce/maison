class GistsController < ApplicationController
  def index
    @gists = Gist.page(params[:page])
  end

  def show
    @gist = Gist.find(params[:id])
  end
end
