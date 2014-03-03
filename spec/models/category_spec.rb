require 'spec_helper'
require 'digest/md5'

describe Category do
  let(:category) { create(:category) }
  let(:post) { create(:post) }
  
  it "should change category.posts count" do
    expect{ 
      post.category = category 
      post.update
    }.to change{ category.posts.count }.from(0).to(1)
  end
end
