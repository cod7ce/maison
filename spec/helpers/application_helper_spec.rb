require 'spec_helper'

describe ApplicationHelper do

  describe 'markdown' do
   it "should convert to html" do
     helper.markdown("## hello world!").should == "<h2>hello world!</h2>\n"
   end
  end

  describe 'coderay' do
    let(:snippet) { create(:snippet) }
    it "should convert to code highline" do
      snippet.code = "echo 1"
      helper.coderay(snippet).should == "<div class=\"CodeRay\">\n  <div class=\"code\"><pre><span class=\"line-numbers\"><a href=\"#n1\" name=\"n1\">1</a></span>echo <span style=\"color:#00D\">1</span></pre></div>\n</div>\n"
    end
  end

  describe 'seo_friendly_path' do
    let(:post) { create(:post) }
    it "should get seo path" do
      helper.seo_friendly_path(post).should == "#{post.class.to_s.downcase.pluralize}/#{post.user.name}/#{post.alias}"
    end
  end
end
