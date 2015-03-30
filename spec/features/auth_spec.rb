require 'rails_helper'
require 'capybara/rails'

feature 'SignUp' do
  scenario "User can sign up" do
    visit root_path
    click_on "Sign Up"
    fill_in "First Name", with: "Chaka"
    fill_in "Last Name", with: "Khan"
    fill_in "Email", with: "chaka@khan.com"
    fill_in "Password", with: "password"
    within ("#new_user") do
      click_on "Log In"
    end
    expect(page).to have_content("Chaka")
  end

  scenario "User can sign out" do
    visit root_path
    click_on "Sign Up"
    fill_in "First Name", with: "Chaka"
    fill_in "Last Name", with: "Khan"
    fill_in "Email", with: "chaka@khan.com"
    fill_in "Password", with: "password"
    within ("#new_user") do
      click_on "Log In"
    end
    expect(page).to have_content("Chaka")
    click_on "Log Out"
    expect(page).to_not have_content("Chaka")
  end

  scenario "User can sign in" do
    visit root_path
    click_on "Sign Up"
    fill_in "First Name", with: "Chaka"
    fill_in "Last Name", with: "Khan"
    fill_in "Email", with: "chaka@khan.com"
    fill_in "Password", with: "password"
    within ("#new_user") do
      click_on "Log In"
    end
    visit signin_path
    fill_in "email", with: "chaka@khan.com"
    fill_in "Your password", with: "password"

      click_on "Log In"

    expect(page).to have_content("Chaka")
  end
end
