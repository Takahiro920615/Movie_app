Rails.application.routes.draw do
  root 'home#top'
  get 'about', to: 'home#about'

  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get  '/map', to: 'map#show'

  get '/tmdb', to: 'tmdb#index'
  
  get '/user_images/:filename', to: 'users#user_image', as: 'user_image'

  resources :users do
    resources :movies do
      resources :comments, only: [:create, :destroy]
    end
      # member do
      #   post 'like', to: 'users#like', as: 'like_user_movie'
      #   post 'unlike', to: 'users#unlike', as: 'unlike_user_movie'
      # end
    # end
  end

  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

