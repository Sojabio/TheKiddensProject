Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "items#index"
  resources :items do
    member do
      post 'add_to_cart'
    end
  end
  
  namespace :admin do
    root 'orders#index'
    resources :orders
    resources :items
  end

  resources :carts
  resources :orders
  resources :users
  resources :cart_items, except: [:show]

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

end