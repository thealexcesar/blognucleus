Rails.application.routes.draw do
  root to: "home#index"
  namespace :admin do
    resources :posts
    resources :users do
    end
  end

  resources :posts do
    post 'create_comment', on: :collection
  end

  devise_for :users

  # mount Ckeditor::Engine => '/ckeditor'
  # get '/home', to: 'home#index', as: 'home'
end
