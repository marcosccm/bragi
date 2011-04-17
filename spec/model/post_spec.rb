describe "Post" do
  describe "when a post is created" do
    it "should validate the presence of a title" do
      p = Post.create
      p.errors.should include(:title => ["can't be blank"])
    end

    it "should validate the presence of a body" do
      p = Post.create
      p.errors.should include(:body => ["can't be blank"])
    end

    it "should use the title as the key" do
      p = Post.create!(:title => "a cool post", :body => "cool content")
      p.id.should == "a-cool-post"
    end
  end
end
