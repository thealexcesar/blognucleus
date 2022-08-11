Rails.application.routes.draw do
  resources :posts
  root to: "home#index"
  namespace :admin do
    resources :posts
    resources :users
    get '/main/index', to: 'main#index'
  end

  resources :posts do
    get '/posts/order_by', on: :collection
    post 'create_comment', on: :collection
  end


  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # mount Ckeditor::Engine => '/ckeditor'
end
