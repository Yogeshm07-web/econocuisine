Rails.application.routes.draw do
  resources :budgets, only: [:index]
  devise_for :users
  delete "basket_items/:id", to: "basket_items#destroy", as: :basket_item_delete
  resources :inventories
  delete '/inventories/:id', to: 'inventories#destroy', as: 'delete_inventory'
  resources :baskets, only: [:index, :show, :create, :update, :destroy] do
    post 'add_to_basket', on: :member
  end
  resources :products do
    post 'add_to_basket', on: :member
  end
  resources :reviews
  resources :incomes
  resources :expenses
  resources :basket_items, only: [:create]


  get 'le_wagon_supermarket', to: 'products#le_wagon_supermarket'
  root to: "pages#home"
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end






