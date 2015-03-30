require 'rails_helper'
require 'capybara/rails'

feature 'Rants' do

  scenario "Users can create a rant" do
      visit root_path
      click_on "Sign Up"
      fill_in "First Name", with: "Chaka"
      fill_in "Last Name", with: "Khan"
      fill_in "Email", with: "chaka@khan.com"
      fill_in "Password", with: "password"
      within ("#new_user") do
        click_on "Log In"
      end
      visit root_path
      click_on "New Rant"
      fill_in "Rant Title", with: "Rant Title In The Place"
      fill_in "Start ranting", with: ("Rant Body In The Place" * 25)
      click_on "Save"
      expect(page).to have_content("Rant Title In The Place")
      expect(page).to have_content("Rant Body In The Place")
  end

  scenario "Users can edit a rant" do
    visit root_path
    click_on "Sign Up"
    fill_in "First Name", with: "Chaka"
    fill_in "Last Name", with: "Khan"
    fill_in "Email", with: "chaka@khan.com"
    fill_in "Password", with: "password"
    within ("#new_user") do
      click_on "Log In"
    end

    visit root_path
    click_on "New Rant"
    fill_in "Rant Title", with: "Rant Title In The Place"
    fill_in "Start ranting", with: ("Rant Body In The Place" * 25)
    click_on "Save"
    expect(page).to have_content("Rant Title In The Place")
    expect(page).to have_content("Rant Body In The Place")
    click_on "Edit"
    #breaks here
    fill_in "Rant Title", with: "Rant Title Legit"
    fill_in "Start ranting", with: ("Rant Body Legit" * 25)
    click_on "Save"
    expect(page).to have_content("Rant Title Legit")
    expect(page).to have_content("Rant Body Legit")
  end

  scenario "Users can delete a rant" do
    visit root_path
    click_on "Sign Up"
    fill_in "First Name", with: "Chaka"
    fill_in "Last Name", with: "Khan"
    fill_in "Email", with: "chaka@khan.com"
    fill_in "Password", with: "password"
    within ("#new_user") do
      click_on "Log In"
    end
    visit root_path
    click_on "New Rant"
    fill_in "Rant Title", with: "Rant Title In The Place"
    fill_in "Start ranting", with: ("Rant Body In The Place" * 25)
    click_on "Save"
    expect(page).to have_content("Rant Title In The Place")
    expect(page).to have_content("Rant Body In The Place")
    click_on "Edit"
    click_on "Delete"
    expect(page).to_not have_content("Rant Title In The Place")
    expect(page).to_not have_content("Rant Body In The Place")
  end

  scenario "Users have to type in at least 144 characters in the body of rant" do
    visit root_path
    click_on "Sign Up"
    fill_in "First Name", with: "Chaka"
    fill_in "Last Name", with: "Khan"
    fill_in "Email", with: "chaka@khan.com"
    fill_in "Password", with: "password"
    within ("#new_user") do
      click_on "Log In"
    end
    visit root_path
    click_on "New Rant"
    fill_in "Rant Title", with: "Rant Title In The Place"
    fill_in "Start ranting", with: ("Rant Body In The Place")
    click_on "Save"
    expect(page).to have_content("Body is too short (minimum is 144 characters)")
  end
end
