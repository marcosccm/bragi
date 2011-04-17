require "spec_helper"

describe "Author Posts Area" do 
  describe "When an author is logged in" do
    before(:each) do
      Author.create!(:email => "marcosccm@gmail.com", :password => "teste")
      visit log_in_path
      fill_in 'Email', :with => "marcosccm@gmail.com"
      fill_in 'Password', :with => "teste"
      click_on "Log In"
    end
    
    it "should be able to create new posts" do
      click_on "Add Post"
      fill_in 'Title', :with => "a cool post title"
      fill_in 'Body', :with => "cool post body"
      click_on "Save"
      page.should have_content("Post created successfully")
      page.should have_content("a cool post title")
      page.should have_content("cool post body")
    end

    it "should be able to edit posts" do
      Post.create!(:title => "a cool post title", :body => "cool post body")
      visit author_posts_path
      within( "li:first") do
        click_link "edit"
      end
      fill_in 'Title', :with => "another post title"
      fill_in 'Body', :with => "another post body"
      click_on "Save"
      page.should have_content("Post edited successfully")
      page.should have_content("another post title")
      page.should have_content("another post body")
    end

    it "should be able to delete posts" do
      Post.create!(:title => "i am to young to die", :body => "help")
      visit author_posts_path
      within("li:first") { click_link "remove" }
      page.should have_content("Post removed successfully")
      page.should_not  have_content("i am to young to die")
      page.should_not  have_content("help")
    end
  end
end
