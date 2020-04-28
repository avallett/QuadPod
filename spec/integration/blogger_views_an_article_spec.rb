require 'rails_helper.rb'

feature "Blogger views an article" do
    scenario "Blogger successfully views a created article" do
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
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Create Article"
        visit articles_path
        click_link "Show"
        expect(page).to have_content("Add a comment:")
        expect(page).to have_field("Commenter")
        expect(page).to have_field("Body")
    end
end