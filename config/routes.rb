Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :customers
  resources :customers, only: [:index]

  resources :product, only: [:show]do
    post 'add_to_cart', on: :member
  end

  resources :carts, only: [:show] do
    member do
      delete :remove_from_cart
    end
  end

  resources :orders, only: [:index, :show] do
    resources :payments, only: [:new, :create]
    member do
      post :checkout
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'product#index'
end
