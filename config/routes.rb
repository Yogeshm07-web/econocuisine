Rails.application.routes.draw do
  resources :budgets, only: [:index]
  devise_for :users
  resources :inventories
  resources :baskets, only: [:index, :show, :create, :update, :destroy] do
    post 'add_to_basket', on: :member
  end
  resources :products do
    post 'add_to_basket', on: :member
  end
  resources :reviews
  resources :incomes
  resources :expenses
  resources :basket_items, only: [:create, :destroy]
  get 'le_wagon_supermarket', to: 'products#le_wagon_supermarket'
  root to: "pages#home"
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get "up" => "rails/health#show", as: :rails_health_check
end
