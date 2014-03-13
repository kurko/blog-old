Blog::Application.routes.draw do

  get "taxonomy/index"
  get "taxonomy/show"
  get "dashboard/index"

  get "about" => "static_pages#about"
  get "oss"   => "static_pages#oss"

  devise_for :admin_users, path: "admin",
    controllers: {
      sessions: "admin/sessions"
    }

  namespace :admin do
    resources :texts
    resources :taxonomies

    root :to => 'texts#index'
  end

  resources :texts, only: [:index, :show]

  namespace :api do
    resources :texts, only: [:index, :show]
  end

  get "home/index"

  root :to => 'home#index'
end
