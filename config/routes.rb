Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :wineries, only: [:index, :show, :create]
      resources :bottles, only: [:index, :show, :create, :update, :destroy]
      post '/signup', to: 'users#create'
      get '/me/:id', to: 'users#show'
    end
  end
  post '/login', to: 'sessions#create'
  delete '/logout/:id', to: 'sessions#destroy'
end
