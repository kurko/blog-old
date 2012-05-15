class Admin::ApplicationController < ActionController::Base
  protect_from_forgery

  layout "admin"
  before_filter :authenticate_admin_user!
end
