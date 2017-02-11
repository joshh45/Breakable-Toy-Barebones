require 'rails_helper'
require 'spec_helper'


feature 'Log In' do
  scenario 'an existing user specifies a valid email and password' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Login"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to_not have_content("Sign Up")
    expect(page).to_not have_content("Log In")
    expect(page).to have_content("Discover")
  end

  scenario "a non-existant user tries to login" do
    visit root_path
    click_link "Login"

    fill_in "Email", with: "notrealuser@gmail.com"
    fill_in 'Password', with: "notrealpassword"
    click_button "Log in"
    expect(page).to have_content("Log in")
  end

  scenario "a current_user fills in an incorrect password" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Login"

    fill_in "Email", with: user.email
    fill_in 'Password', with: "notrealpassword"
    click_button "Log in"
    expect(page).to have_content("Log in")
  end
end
