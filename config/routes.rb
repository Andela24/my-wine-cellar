Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:index, :show, :create]
  resources :wineries, only: [:index, :show, :create]
  resources :bottles, only: [:index, :show, :create, :update, :destroy]
  post '/signup', to: 'users#create'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'my_wineries', to: 'wineries#my_wineries'
end