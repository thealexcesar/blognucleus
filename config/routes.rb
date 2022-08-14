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

    get 'culture', on: :collection
    get 'graphic', on: :collection
    get 'financial', on: :collection
    get 'technology', on: :collection

    post 'create_comment', on: :collection
    delete 'destroy_comment', on: :collection
  end


  devise_for :users
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

  # mount Ckeditor::Engine => '/ckeditor'
end
