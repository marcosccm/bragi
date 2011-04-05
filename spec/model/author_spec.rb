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
end
