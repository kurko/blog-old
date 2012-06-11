module AcceptanceHelpers
  def admin_login
    FactoryGirl.create(:admin_user)
    visit admin_root_path

    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "123456"

    click_button "Sign in"
  end

  def default_taxonomy
    FactoryGirl.create(:taxonomy, name: "News")
    FactoryGirl.create(:taxonomy, name: "Essays")
    FactoryGirl.create(:taxonomy, name: "Software")
  end
end
