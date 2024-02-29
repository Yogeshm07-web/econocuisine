Rails.application.routes.draw do
  resources :budgets, only: [:index]
  devise_for :users
  resources :inventories
  resources :baskets, only: [:index, :show, :create, :update, :destroy]
  resources :products
  resources :reviews
  resources :incomes
  resources :expenses
  get 'le_wagon_supermarket', to: 'products#le_wagon_supermarket'
  root to: "pages#home"
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'
  resources :products do
    post 'add_to_basket', on: :member
  end
  delete '/delete_product', to: 'products#delete_product'
  delete '/delete_all_products', to: 'products#delete_all_products'


  post '/baskets/add_to_basket/:id', to: 'baskets#add_to_basket', as: 'add_to_basket'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  post 'add_to_basket', to: 'basket_items#add_to_basket'

  delete '/basket_items/:id', to: 'basket_items#destroy', as: 'delete_basket_item'

end
