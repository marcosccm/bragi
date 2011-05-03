require 'spec_helper'

feature "The Home Page" do
  scenario "should list all  posts" do
    visit root_path
    page.should have_content("this is a cool post")
    page.should have_content("this is another cool post")
    page.should have_content("too much coolness")
  end

  scenario "should lead to post details page" do
    visit root_path
    click_link "A post"
    page.should have_content("this is a cool post")
  end
end
