Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "items#index"
  resources :items do
    member do
      post 'add_to_cart'
    end
  end
  resources :carts
  resources :orders
  resources :users
  resources :cart_items, except: [:show]
end
