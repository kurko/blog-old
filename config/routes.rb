Blog::Application.routes.draw do

  get "dashboard/index"

  devise_for :admin_users, path: "admin",
    controllers: {
      sessions: "admin/sessions"
    }

  namespace :admin do
    resources :texts
    resources :taxonomies

    root :to => 'texts#index'
  end

  get "home/index"

  root :to => 'home#index'
end
