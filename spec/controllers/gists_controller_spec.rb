require 'spec_helper'

describe GistsController do
  let(:gist) { create(:gist) }
  let(:snippet) { create(:snippet) }

  describe ':index' do
    it "should have index action" do
      get :index
      response.should be_success
    end
  end

  describe ':show' do
    it "should show gist" do
      get :show, :user => gist.user.name, :alias => gist.alias
      response.should be_success
    end
  end

  describe ':raw' do
    it "should show snippet raw file" do
      get :raw, :id => snippet.gist.id, :snippet_id => snippet.id, :filename => snippet.filename
      response.should be_success
    end
  end
end
