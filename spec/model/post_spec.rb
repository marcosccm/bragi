require "spec_helper"

describe "Post" do
  describe "can be created from a file" do
    before(:each) do
      path = File.expand_path("../../fixtures/test_post_1", __FILE__)
      @post = Post.new(path)
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
