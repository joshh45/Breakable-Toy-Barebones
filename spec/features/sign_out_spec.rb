require 'rails_helper'
require 'spec_helper'

feature 'Sign out' do
  scenario 'Users can sign out of existing account' do
    visit root_path
    click_link 'Sign up'

    fill_in 'Name', with: 'josh'
    fill_in 'Email', with: 'joshh@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Discover")
    click_link 'Logout'
    expect(page).to have_content("Sign up")
  end
end
