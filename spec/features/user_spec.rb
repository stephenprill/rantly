require 'rails_helper'
require 'capybara/rails'

feature 'Users' do
  scenario "Users can see list of all users in the users route" do
    create_user
      visit root_path
      click_on "Sign Up"
      fill_in "First name", with: "Chaka"
      fill_in "Last name", with: "Khan"
      fill_in "Email", with: "chaka@khan.com"
      fill_in "Password", with: "password"
      within ".form-horizontal" do
        click_on "Sign Up"
      end
      click_on "Users"
      expect(page).to have_content("Jones")
  end


end
