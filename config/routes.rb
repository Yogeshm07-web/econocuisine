# require 'rails'
# require 'rails/health' # Add the missing import statement for 'rails/health' controller

Rails.application.routes.draw do
  resources :budgets, only: [:index]
  devise_for :users
  resources :inventories
  delete '/inventories/:id', to: 'inventories#destroy', as: 'delete_inventory'

  resources :baskets do
    resources :basket_items, only: [:create, :destroy]
  end

  # Define the add_to_basket route for baskets controller
  post 'baskets/add_to_basket/:id', to: 'baskets#add_to_basket', as: 'add_to_basket'

  # Define the add_to_basket route for products controller
  resources :products do
    post 'add_to_basket', on: :member
  end

  resources :reviews
      
   
  # Define the le_wagon_supermarket route
  get 'le_wagon_supermarket', to: 'products#le_wagon_supermarket'

  # Define root route
  root to: "pages#home"

  # Define custom signin and signup routes
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
