Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index]
  resources :topics, only: [:index, :show, :edit, :destroy, :create] do
    resources :posts
  end
  root to: "topics#index"
end
