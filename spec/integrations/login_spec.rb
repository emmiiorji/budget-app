require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  background { visit new_user_registration_path }

  scenario 'with valid information' do
    fill_in 'user[first_name]', with: 'Emmanuel'
    fill_in 'user[last_name]', with: 'Orji'
    fill_in 'user[email]', with: 'emmanuelorji2013@gmail.com'
    fill_in 'user[password]', with: 'emmy12345'
    fill_in 'user[password_confirmation]', with: 'emmy12345'

    click_button 'Next'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'with invalid information' do
    fill_in 'user[first_name]', with: 'Emmanuel'
    fill_in 'user[last_name]', with: 'Orji'
    fill_in 'user[email]', with: 'emmanuelorji2013@gmail.com'
    fill_in 'user[password]', with: 'emmy12345s'
    fill_in 'user[password_confirmation]', with: 'emmy12345'

    click_button 'Next'
    expect(page).to have_content('error prohibited this user from being saved')
  end
end
