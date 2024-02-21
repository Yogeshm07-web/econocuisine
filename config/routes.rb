Rails.application.routes.draw do
  resources :budgets, only: [:index]
  devise_for :users
  resources :inventories
  resources :baskets, only: [:index, :show, :create, :update, :destroy]
  resources :products
  get 'le_wagon_supermarket', to: 'products#le_wagon_supermarket'
  root to: "pages#home"
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'

  post '/baskets/add_to_basket/:id', to: 'baskets#add_to_basket', as: 'add_to_basket'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Resource for the shopping cart
  resource :cart, only: [:show, :update] do
    delete 'remove_product/:id', to: 'carts#remove_product', as: 'remove_product'
    post 'checkout', to: 'carts#checkout', as: 'checkout'
  end
end
