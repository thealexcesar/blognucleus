Rails.application.routes.draw do
  root to: "posts#index"
  resources :posts do
    post 'create_comment', on: :collection
  end
end
