require 'spec_helper'

feature "adding texts" do
  before do
    admin_login
    default_taxonomy
  end

  describe "adding a new text" do
    scenario "As an admin, I want to publish a new text" do
      visit new_admin_text_path

      select "Software", from: "text_taxonomy_id"
      fill_in "text_title", with: "My title"
      fill_in "text_description", with: "My content"
      fill_in "text_content", with: "My content"

      click_button "Publish"

      page.should have_content "My title"
      page.should have_content "Software"
    end

    scenario "As an admin, I want to add a new text as draft" do
      visit new_admin_text_path

      select "Software", from: "text_taxonomy_id"
      fill_in "text_title", with: "My title"
      fill_in "text_description", with: "My content"
      fill_in "text_content", with: "My content"

      click_button "Save as draft"

      page.should have_content "My title (not published)"
      page.should have_content "Software"
    end
  end
end

