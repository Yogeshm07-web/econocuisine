Rails.application.routes.draw do
  devise_for :users

  resources :inventories
  resources :baskets, only: [:index, :show, :create, :update, :destroy]

  resources :products
  post 'add_to_basket', to: 'baskets#add_to_basket', as: 'add_to_basket'

  get 'le_wagon_supermarket', to: 'products#le_wagon_supermarket', as: 'le_wagon_supermarket'

  root to: "pages#home"

  
  # Define your additional routes here
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get 'budgets', to: 'pages#budget', as: 'budgets'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
