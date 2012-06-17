require 'acceptance_spec_helper'

feature "User authorization" do
  before do
    admin_login
  end

  describe "adding a new text" do
    scenario "as an admin, I want to sign up" do
      page.should have_content "Sign out"
      page.should have_content "New Text"
    end
  end
end
