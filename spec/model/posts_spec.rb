require "spec_helper"

describe Posts do
  before(:each) do
    PostFactory.create('post_1', :title => "post a", :body => "body 1", :published_at => "01/01/2000")
    PostFactory.create('post_2', :title => "post b", :body => "body 2", :published_at => "02/02/2001")
    PostFactory.create('post_3', :title => "post c", :body => "body 3", :published_at => "03/03/1999")
  end

  it "list all posts on a folder" do
    posts = Posts.all
    posts.count.should == 3
  end

  it "list posts ordered by published date" do
    posts = Posts.ordered
    posts.first.title.should == "post b"
    posts.second.title.should  == "post a"
    posts.third.title.should == "post c"
  end
  
  it "can find a post by slug" do
    post = Posts.find('post-a')
    post.should be_present
  end
end
