require 'rails_helper'
require 'capybara/rails'

feature 'SignUp' do
  scenario "User can sign up" do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Chaka"
    fill_in "Last name", with: "Khan"
    fill_in "Email", with: "chaka@khan.com"
    fill_in "Password", with: "password"
    within ".form-horizontal" do
      click_on "Sign Up"
    end
    expect(page).to have_content("Chaka")
  end

  scenario "User can sign out" do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Chaka"
    fill_in "Last name", with: "Khan"
    fill_in "Email", with: "chaka@khan.com"
    fill_in "Password", with: "password"
    within ".form-horizontal" do
      click_on "Sign Up"
    end
    expect(page).to have_content("Chaka")
    click_on "Sign Out"
    expect(page).to_not have_content("Chaka")
  end

  scenario "User can sign in" do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Chaka"
    fill_in "Last name", with: "Khan"
    fill_in "Email", with: "chaka@khan.com"
    fill_in "Password", with: "password"
    within ".form-horizontal" do
      click_on "Sign Up"
    end
    visit signin_path
    fill_in "Email", with: "chaka@khan.com"
    fill_in "Password", with: "password"

      click_on "Log In"

    expect(page).to have_content("Chaka")
  end
end
