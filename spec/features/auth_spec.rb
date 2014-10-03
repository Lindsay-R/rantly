require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

  scenario 'Users can create an account and login/logout' do
    visit root_path
    click_on "JOIN"
    expect(page).to have_content("Register")
    click_on "REGISTER"

    expect(page).to have_content("Username can't be blank")

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"
    fill_in "Bio", with: "This is my bio."
    choose('Weekly')
    click_on "REGISTER"

    expect(page).to have_content("John Smith")

    click_on "LOGOUT"

    expect(page).to have_content("Let it all roll out")


  end

end