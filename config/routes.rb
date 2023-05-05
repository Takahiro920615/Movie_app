Rails.application.routes.draw do
  root 'home#top'
  get 'about', to: 'home#about'

  resources :users do
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
