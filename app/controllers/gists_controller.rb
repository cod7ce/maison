class GistsController < ApplicationController
  def index
    @gists = Gist.page(params[:page])
    set_seo_meta('代码片段')
  end

  def show
    @gist = Gist.find(params[:id])
    set_seo_meta(@gist.title, @gist.keywords, @gist.summary)
  end

  def raw
    gist = Gist.find(params[:id])
    snippet = gist.snippets.find(params[:snippet_id])
    render :text => snippet.code, :content_type => Mime::TEXT
  end
end
