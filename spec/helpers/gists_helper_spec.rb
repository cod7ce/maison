require 'spec_helper'

describe GistsHelper do

  describe 'snippet' do
    let(:snippet) { create(:snippet) }
    it "should get raw path" do
      snippet.code = "echo 1"
      helper.raw_snippet_path(snippet).should == "#{gist_path(snippet.gist)}/raw/#{snippet.id}/#{snippet.filename}"
    end
  end

end
