require 'spec_helper'

describe Post do
  subject(:post) { create(:post) }

  its(:tag_list) { should == post.tags.join(',')}
  its(:keywords) { should == "#{post.tag_list},#{post.category.name},#{post.title}"}

  it "should change tags value when change tag_list" do
    expect { post.tag_list = 'tag3,tag4' }.to change{ post.tags }.to(['tag3','tag4'])
  end
end
