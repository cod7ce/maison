class GistsController < ApplicationController
  def index
    @gists = Gist.page(params[:page])
    set_seo_meta('代码片段')
  end

  def show
    #@gist = Gist.where(:user_id.in => User.where(name: params[:user]).distinct(:_id), :alias => params[:alias]).first
    @gist = Gist.where(:user_id => User.where(name: params[:user]).first.id, :alias => params[:alias]).first
    set_seo_meta(@gist.title, @gist.keywords, @gist.summary)
  end

  def raw
    gist = Gist.find(params[:id])
    snippet = gist.snippets.find(params[:snippet_id])
    render :text => snippet.code, :content_type => Mime::TEXT
  end
end
