require "spec_helper"

feature  "Author Sessions" do
  scenario "user should be redirected when trying to access author area without login" do
    visit author_posts_path
    current_path.should == posts_path
    page.should have_content ("you must log in to access that area")
  end
  
  scenario "user should be able to create a session with a correct email and password" do
    Author.create!(:email => "marcosccm@gmail.com", :password => "teste")
    visit log_in_path
    fill_in 'Email', :with => "marcosccm@gmail.com"
    fill_in 'Password', :with => "teste"
    click_on "Log In"
    page.should have_content('Succefully logged in')
  end  
  
  scenario "user should not be able to create a session without a correct email and password" do
    Author.create!(:email => "marcosccm@gmail.com", :password => "teste")
    visit log_in_path
    fill_in 'Email', :with => "nonexistent@gmail.com"
    fill_in 'Password', :with => "bla"
    click_on "Log In"
    page.should have_content("Invalid email or password")
  end
end
