Blog::Application.routes.draw do
  get "dashboard/index"

  devise_for :admin_users, path: "admin",
    controllers: {
      sessions: "admin/sessions"
    }

  namespace :admin do

    root :to => 'dashboard#index'
  end

  get "home/index"

  root :to => 'home#index'
end
