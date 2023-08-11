Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  resources :users, only: [:show, :index, :edit] do
    member do
      get :following, :follower
    end
    put :update_location, on: :member
  end
  resources :events, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :topics, only: [:index, :show, :edit, :destroy, :create] do
    resources :posts
  end
  resources :relationships, only: [:create, :destroy]
  resources :conversations do
    resources :messages do
      post "/translate", to: "messages#translate"
    end
  end
  root to: "topics#index"
  get 'change_locale/:locale', to: 'application#change_locale', as: :change_locale
end
