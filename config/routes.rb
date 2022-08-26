Rails.application.routes.draw do

  root to: "home#index"

  get '/home/contact', to: 'home#contact'

  namespace :admin do
    resources :main
    resources :posts
    resources :users
    get '/main/index', to: 'main#index'
  end

  # resources :posts
  resources :posts do
    get 'order_by', on: :collection
    post 'create_comment', on: :collection
    delete 'destroy_comment', on: :collection
  end

  get 'author_posts', to: 'posts#author_posts'
  get 'categories', to: 'posts#categories'

  devise_for :users
end
