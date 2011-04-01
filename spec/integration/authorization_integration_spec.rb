require "spec_helper"

feature "Author authorization" do
  scenario "A user not logged in cannot access the admin namespace" do
    visit admin_page
    current_path.should == session_create_path
    page.should have_content("You need to be logged in to access that page")
  end
end
