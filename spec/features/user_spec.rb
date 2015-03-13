require 'rails_helper'
require 'capybara/rails'

feature 'SignUp' do
  scenario "User can register at signup route" do
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
end
