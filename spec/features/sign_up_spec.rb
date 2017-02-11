require 'rails_helper'
require 'spec_helper'

feature 'New User Sign Up' do
  scenario 'user specifies valid requirements within the fields' do
    visit root_path
    click_link 'Sign up'

    fill_in 'Name', with: 'josh'
    fill_in 'Email', with: 'joshh@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

  scenario 'user fails to provide valid requirements within the fields' do
    visit root_path
    click_link 'Sign up'
    click_button 'Sign up'
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'users password confirmation does not match password' do
    visit root_path
    click_link 'Sign up'

    fill_in 'Name', with: 'josh'
    fill_in 'Email', with: 'joshh@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password111'
    click_button 'Sign up'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
