require "spec_helper"

describe Posts do
  before(:each) do
    PostFactory.create('post_1', :title => "cool post", :body => "this is a cool post")
    PostFactory.create('post_2', :title => "this is another cool post", :body => "this is a cool post")
    PostFactory.create('post_3', :title => "too much coolness", :body => "this is a cool post")
  end

  it "list all posts on a folder" do
    posts = Posts.all
    posts.count.should == 3
  end

  it "can find a post by slug" do
    post = Posts.find('cool-post')
    post.should be_present
  end
end
