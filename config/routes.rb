Rails.application.routes.draw do
  root to: "home#index"
  namespace :admin do
    resources :posts
    resources :users do
      post 'create', on: :collection
      post 'update', on: :collection
      post 'destroy', on: :collection
    end
  end

  resources :posts do
    post 'create_comment', on: :collection
  end

  devise_for :users

  # mount Ckeditor::Engine => '/ckeditor'
end
