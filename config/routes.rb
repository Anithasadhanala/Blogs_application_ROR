Rails.application.routes.draw do
  # Health check
  get "up", to: "rails/health#show", as: :rails_health_check

  # Login
  get "/login", to: "users#signin"
  post "/login", to: "users#login"


  # Register
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"


  # Delete user
  delete "/user", to: "users#destroy"

  
  # New blog
  get "/newblog", to: "blogs#new"
  post "/blogs", to: "blogs#create"

  # Show all blogs
  get "/myblogs", to: "blogs#show"
  get "/blogs", to: "blogs#showall"

  # Show individual blog
  get "/blog/:id/edit", to: "blogs#edit", as: :editblog
  patch '/blog/:id/edit', to: 'blogs#update', as: :updateblog

  delete '/blog/:id', to: 'blogs#delete', as: :deleteblog


  get "/blog/:id", to: "blogs#each", as: :eachblog
  
  post '/blog/:id', to: "blogs#react", as: :reactblog

  post "/blog/:id/flag", to: "blogs#flagged", as: :flagblog


  post "blog/:id/comments", to: "comments#create", as: :createcomment

  post "blog/:id/save", to:"blogs#save", as: :saveblog_path

  patch "blog/:id/edit-comments", to: "comments#edit", as: :editcomment

  get "mysaved-blogs", to:"blogs#mysaved"


  # Root
  root "home#index"
end
