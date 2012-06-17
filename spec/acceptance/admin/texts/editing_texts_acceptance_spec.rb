require 'acceptance_spec_helper'

feature "editing texts" do
  before do
    admin_login
    default_taxonomy
  end

  describe "editing a text" do
    before do
      FactoryGirl.create(:text)
      visit admin_texts_path
      click_link "My text title"
    end

    scenario "As an admin, I want to save an existent text as published" do
      click_button "Publish"

      page.should have_content "My text title"
    end

    scenario "As an admin, I want to save an existent text as draft" do
      click_button "Save as draft"

      page.should have_content "My text title (not published)"
    end
  end
end

