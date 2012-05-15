Blog::Application.routes.draw do
  get "dashboard/index"

  devise_for :admin_users

  get "home/index"

  root :to => 'home#index'
end
