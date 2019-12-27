Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  namespace :admin do
    # Add dashboard for your models here

    resources :movies
    resources :users

    root to: "movies#index"
  end
  # movie custom routes
  root to: "movies#index" # <--- Root route
  get 'movies/:id', to: 'movies#show', as: :movie
  get 'movies', to: 'movies#index', as: :movies

  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout
  post 'login', to: 'sessions#create'

end

