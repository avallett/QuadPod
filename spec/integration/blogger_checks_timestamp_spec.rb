require 'rails_helper.rb'

feature "Blogger checks article information" do
    scenario "Blogger successfully views article timestamp" do
        visit welcome_index_url
        click_link "Sign Up"
        fill_in "Name", with: "Test Subject"
        fill_in "Email", with: "austen.valletta@yahoo.com"
        fill_in "Password", with: "Password123"
        fill_in "Password confirmation", with: "Password123"
        click_button "Create User"
        visit welcome_index_url
        click_on "Log In"
        fill_in "Email", with: "austen.valletta@yahoo.com"
        fill_in "Password", with: "Password123"
        click_on "Login"
        visit articles_path
        expect(page).to have_content("New article")
        click_on "New article"
        fill_in "Title", with: "First Article"
        fill_in "Text", with: "This is the first Article."
        click_button "Create Article"
        expect(page).to have_content("Created at ")
    end
end