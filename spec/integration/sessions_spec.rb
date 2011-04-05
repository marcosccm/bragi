require "spec_helper"

feature  "Author Sessions" do
  scenario "creating a author session" do
    Author.create!(:email => "marcosccm@gmail.com", :password => "teste")
    visit log_in_path
    fill_in 'Email', :with => "marcosccm@gmail.com"
    fill_in 'Password', :with => "teste"
    click "Log In"
    page.should have_content('Succefully logged in')
  end
end
