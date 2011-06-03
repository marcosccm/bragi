require 'spec_helper'

feature "The Home Page" do
  scenario "should list all  posts" do
    PostFactory.create('post_1', :title => "cool post", :body => "this is a cool post")
    PostFactory.create('post_2', :title => "this is another cool post", :body => "this is a cool post")
    PostFactory.create('post_3', :title => "too much coolness", :body => "this is a cool post")
    visit root_path
    page.should have_content("this is a cool post")
    page.should have_content("this is another cool post")
    page.should have_content("too much coolness")
  end

  scenario "should lead to post details page" do
    PostFactory.create('post_4', :title => "A post", :body => "this is a cool post")
    visit root_path
    click_link "A post"
    page.should have_content("this is a cool post")
  end
end
