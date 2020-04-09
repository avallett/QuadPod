require 'rails_helper.rb'

feature "Blogger views an article" do
    scenario "Blogger successfully views a created article" do
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