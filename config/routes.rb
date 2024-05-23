Rails.application.routes.draw do
  
  resources :blogs

 
  get "up" => "rails/health#show", as: :rails_health_check

  get "/login", to: "users#signin"
  post "/login", to: "users#login"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  delete '/signup', to: 'users#destroy'


  root "home#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
