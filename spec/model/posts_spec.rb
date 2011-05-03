require "spec_helper"

describe Posts do
  it "should list all posts on a folder" do
    posts = Posts.all
    posts.count.should == 4
  end

  it "should be able to find a post by slug" do
    post = Posts.find('a-post')
    post.should be_present
  end
end
