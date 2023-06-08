Rails.application.routes.draw do
  root "items#index"
  devise_for :users, controllers: { registrations: 'users/registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :items do
    member do
      post 'add_to_cart'
    end
  end

  namespace :admin do
    resources :items do
      member do
        post 'chabracadabra'
      end
    end
  end

  resources :carts
  resources :orders
  resources :users
  resources :cart_items, except: [:show]

  namespace :admin do
    root 'admins#show'
    resources :orders
    resources :items
  end
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

end