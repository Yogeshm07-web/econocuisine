Rails.application.routes.draw do
  devise_for :users

  # Define resourceful routes
  resources :inventories
  resources :baskets
  resources :product do
    post 'add_to_inventory', on: :member
  end
  resources :product

  # Define custom routes
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get 'budgets', to: 'pages#budget', as: 'budgets'
end
