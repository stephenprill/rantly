require 'rails_helper'
require 'capybara/rails'

feature 'Users' do
  scenario "Users can see list of all users in the users route" do
    create_user
      visit root_path

      click_on "Sign Up"
      fill_in "First Name", with: "Chaka"
      fill_in "Last Name", with: "Khan"
      fill_in "Email", with: "chaka@khan.com"
      fill_in "Password", with: "password"
      within ("#new_user") do
        click_on "Log In"
      end
      click_on "Users"
      expect(page).to have_content("Jones")
  end






end
