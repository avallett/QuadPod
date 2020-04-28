require 'rails_helper.rb'

feature "Blogger creates an account" do
    scenario "Blogger successfully signs up with new account" do
        visit welcome_index_url
        expect(page).to have_content("Welcome to the Blog")
        click_link "Sign Up"
        fill_in "Name", with: "Test Subject"
        fill_in "Email", with: "austen.valletta@yahoo.com"
        fill_in "Password", with: "Password123"
        fill_in "Password confirmation", with: "Password123"
        click_button "Create User"
        expect(page).to have_content("User was successfully created.")
    end
end