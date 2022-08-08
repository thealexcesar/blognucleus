Rails.application.routes.draw do
  root to: "posts#index"

  namespace :admin do
    resources :users
    resources :posts
  end

  resources :posts do
    post 'create_comment', on: :collection
  end

  devise_for :users
end
