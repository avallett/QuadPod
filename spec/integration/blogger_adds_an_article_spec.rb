require 'rails_helper.rb'

feature "Blogger adds an article" do
    scenario "Blogger successfully navigates to the new articles page from the listing articles page" do
        visit welcome_index_url
        click_link "Sign Up"
        fill_in "Name", with: "Test Subject"
        fill_in "Email", with: "austen.valletta@yahoo.com"
        fill_in "Password", with: "Password123"
        fill_in "Password confirmation", with: "Password123"
        click_button "Create User"
        visit articles_path
        expect(page).to have_content("Articles")
        click_link "New article"
        expect(page).to have_content("New Article")
        expect(page).to have_field("Title")
        expect(page).to have_field("Text")
    end
    
    scenario "Blogger successfully creates a new article" do
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
        expect(page).to have_content("First Article")
        expect(page).to have_content("This is the first Article.")
    end
end