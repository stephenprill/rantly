require 'rails_helper'
require 'capybara/rails'

feature 'Rants' do
  scenario "Users can create a rant" do
      visit root_path
      click_on "Sign Up"
      fill_in "First name", with: "Chaka"
      fill_in "Last name", with: "Khan"
      fill_in "Email", with: "chaka@khan.com"
      fill_in "Password", with: "password"
      within ".form-horizontal" do
        click_on "Sign Up"
      end
      visit root_path
      click_on "New Rant"
      fill_in "Title", with: "Rant Title In The Place"
      fill_in "Body", with: "Rant Body In The Place"
      click_on "Save"
      expect(page).to have_content("Rant Title In The Place")
      expect(page).to have_content("Rant Body In The Place")
  end

  scenario "Users can edit a rant" do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Chaka"
    fill_in "Last name", with: "Khan"
    fill_in "Email", with: "chaka@khan.com"
    fill_in "Password", with: "password"
    within ".form-horizontal" do
      click_on "Sign Up"
    end
    visit root_path
    click_on "New Rant"
    fill_in "Title", with: "Rant Title In The Place"
    fill_in "Body", with: "Rant Body In The Place"
    click_on "Save"
    expect(page).to have_content("Rant Title In The Place")
    expect(page).to have_content("Rant Body In The Place")
    click_on "Edit"
    fill_in "Title", with: "Rant Title Legit"
    fill_in "Body", with: "Rant Body Legit"
    click_on "Save"
    expect(page).to have_content("Rant Title Legit")
    expect(page).to have_content("Rant Body Legit")

  end


end
