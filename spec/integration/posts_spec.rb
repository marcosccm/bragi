require 'spec_helper'

feature "The Home Page" do
  scenario "should list all posts titles and headers" do
    PostFactory.create('post_1', :title => "title 1", :header => "header 1" ,:body => "this is a cool post")
    PostFactory.create('post_2', :title => "title 2", :header => "header 2" ,:body => "this is a cool post")
    PostFactory.create('post_3', :title => "title 3", :header => "header 3", :body => "this is a cool post")
    visit root_path

    within("#posts") do
      page.should have_content("title 1")
      page.should have_content("header 1")
      page.should have_content("title 2")
      page.should have_content("header 2")
      page.should have_content("title 3")
      page.should have_content("header 3")
    end
  end

  scenario "should lead to post details page" do
    PostFactory.create('post_4', :title => "A post", :body => "this is a cool post")
    visit root_path
    click_link "A post"
    within("#post") do
      page.should have_content("this is a cool post")
    end
  end
end
