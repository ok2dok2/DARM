Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
  resources :users, only: [:show, :index, :edit] do
    member do
      get :following, :follower
    end
    put :update_location, on: :member
  end
  resources :events, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :timelines, only: [:index, :new, :create, :edit, :update, :destroy] do
    post "/translate/auto", to: "timelines#translate_auto"
  end
  resources :topics, only: [:index, :show, :edit, :destroy, :create, :update] do
    resources :posts
  end
  resources :relationships, only: [:create, :destroy]
  resources :conversations do
    resources :messages do
      post "/translate", to: "messages#translate"
      post "/translate/auto", to: "messages#translate_auto"
    end
  end
  root to: "homes#index"
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  get 'change_locale/:locale', to: 'application#change_locale', as: :change_locale
end
