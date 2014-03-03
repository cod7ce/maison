require 'spec_helper'

describe Gist do
  subject(:gist) { create(:gist) }

  its(:tag_list) { should == gist.tags.join(',')}
  its(:keywords) { should == "#{gist.tag_list},#{gist.title}"}

  it "should change tags value when change tag_list" do
    expect { gist.tag_list = 'tag3,tag4' }.to change{ gist.tags }.to(['tag3','tag4'])
  end

  it "should snippets count from 0 to 1" do
    expect { 
      create(:snippet, gist: gist)
    }.to change{ gist.snippets.count }.from(0).to(1)
  end
end
