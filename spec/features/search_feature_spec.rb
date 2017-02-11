require 'rails_helper'
require 'spec_helper'

feature 'Search form' do
  scenario 'an existing wants to find trips' do
      user = FactoryGirl.create(:user)
      visit root_path
      click_link "Login"

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      expect(page).to have_content("Discover")
      expect(page).to have_content("Explore")
    end

    scenario 'user clicks on Discover and is directed to search forms' do
      user = FactoryGirl.create(:user)
      visit root_path
      click_link "Login"

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      expect(page).to have_content("Discover")
      expect(page).to have_content("Home")
      # search is in react, require enzyme test
    end
  end
