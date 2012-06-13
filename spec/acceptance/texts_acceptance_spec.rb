require 'spec_helper'

feature "texts" do
  before do
    default_taxonomy
  end

  describe "published texts" do
    scenario "As an user, I can see published texts" do
      FactoryGirl.create(:text, :published, taxonomy: Taxonomy.first)
      visit root_path

      page.should have_content "My text title"
    end

    scenario "As an user, I can't see unpublished texts" do
      FactoryGirl.create(:text, :unpublished, taxonomy: Taxonomy.first)
      visit root_path

      page.should_not have_content "My text title"
    end
  end
end

