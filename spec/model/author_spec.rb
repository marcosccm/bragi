require "spec_helper"

describe Author do
  describe "when creating an author" do
    it "should require password" do
      author = Author.new
      author.save
      author.errors.should have(1).error_on(:password)
    end

    it "should encrypt the password" do
      author = Author.new(:password => "test")
      author.save
      author.password_salt.should_not be_nil
      author.password_hash.should_not be_nil
    end
  end

  describe "when an author is authenticated" do
    it "should return an author if the passed parameters are valid" do
      author = Author.new(:email => "marcosccm@gmail.com", :password => "teste")
      author.save
      Author.authenticate("marcosccm@gmail.com", "test").should eq(author)
    end

    it "should return nil if the passed parameters are invalid" do
      Author.authenticate("dont@exist.com", "test").should be_nil
    end
  end
end
