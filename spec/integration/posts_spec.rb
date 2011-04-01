require 'spec_helper'

feature "The Home Page" do
  scenario "should list all  posts" do
    Post.create!(:title => "A post", :body => "this is a cool post")
    Post.create!(:title => "Another Post", :body => "this is another cool post!")
    Post.create!(:title => "And they just keep coming",:body => "too much coolness")
    visit root_path
    page.should have_content("this is a cool post")
    page.should have_content("this is another cool post")
    page.should have_content("too much coolness")
  end
end
