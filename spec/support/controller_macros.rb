module ControllerMacros
  def login_user
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:admin_users]
      @signed_user = FactoryGirl.create(:admin_user)
      sign_in @signed_user
    end
  end
end
