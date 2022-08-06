Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    post 'create_comment', on: :collection
  end
end
