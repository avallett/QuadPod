require 'rails_helper.rb'

feature "Blogger deletes an article" do
    scenario "Blogger successfully deletes a created article" do
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Create Article"
        visit articles_path
        click_link "Destroy"
        expect(page).to have_no_content("New Capybara Article")
    end
end