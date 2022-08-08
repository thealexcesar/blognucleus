Rails.application.routes.draw do
  root to: "home#index"

  namespace :admin do
    resources :users
    resources :posts
    # get '/home', to: 'home#index', as: 'home'
  end

  resources :posts do
    post 'create_comment', on: :collection
  end
  devise_for :users
end
