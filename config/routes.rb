Rails.application.routes.draw do
  devise_for :users
  resources :inventories
  resources :baskets
  resources :product
  root to: "pages#home"  # Keep this line for pages#home as the root route
  # root 'pages#index'    # Comment out or remove this line
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'

  get 'budgets', to: 'pages#budget', as: 'budgets'


  # Defines the root path route ("/")
  # root "posts#index"
end
