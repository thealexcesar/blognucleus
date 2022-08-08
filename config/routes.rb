Rails.application.routes.draw do
  root to: "home#index"
  namespace :admin do
    resources :users do
      post 'create', on: :collection
    end
    resources :posts
    # get '/home', to: 'home#index', as: 'home'
  end

  resources :posts do
    post 'create_comment', on: :collection
  end

  devise_for :users

  # mount Ckeditor::Engine => '/ckeditor'
end
