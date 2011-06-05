require "spec_helper"

describe "Post" do
  describe "created from a file" do
    before(:each) do
      @post = PostFactory.create('post_1', :title => "test post", 
                                           :published_at => "05/08/1986",
                                           :body => "# Title\ncontent")
    end
    
    it "has a title" do
      @post.title.should == "test post"
    end

    it "has a published_at date" do
      @post.published_at.should == DateTime.new(1986, 8, 5)
    end

    it "has a slug based on the title" do
      @post.slug.should  == "test-post"
    end
    
    it "has a html body" do
      @post.body.should == "<h1>Title</h1>\n\n<p>content</p>\n"
    end
  end

  describe "created from a file with complex content" do
    before(:each) do
      @post = PostFactory.create('post_1', :title => "test post", 
                                           :published_at => "05/08/1986",
                                           :body => "# Title\n\nparagraph 1\n\nparagraph 2\n\nparagraph 3")
    end

    it "has html body" do
      @post.body.gsub(/\n/, '').should == "<h1>Title</h1><p>paragraph 1</p><p>paragraph 2</p><p>paragraph 3</p>"
    end
  end
end
