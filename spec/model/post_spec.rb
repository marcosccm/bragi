require "spec_helper"

describe "Post" do
  describe "can be created from a file" do
    before(:each) do
      @post = PostFactory.create('post_1', :title => "test post", 
                                           :published_at => "05/08/1986",
                                           :body => "# Title\ncontent")
    end
    
    it "with a title" do
      @post.title.should == "test post"
    end

    it "with a published_at date" do
      @post.published_at.should == DateTime.new(1986, 8, 5)
    end

    it "with a slug based on the title" do
      @post.slug.should  == "test-post"
    end
    
    it "with a mardown body" do
      @post.body.should == "<h1>Title</h1>\n\n<p>content</p>\n"
    end
  end
end
