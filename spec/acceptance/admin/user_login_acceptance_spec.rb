#require 'acceptance_spec_helper'
require 'spec_helper'

feature "User authorization" do
  background do
    admin_login
  end

  context "adding a new text" do
    scenario "as an admin, I want to sign up" do
      page.should have_content "Sign out"
      page.should have_content "New Text"
    end
  end
end
