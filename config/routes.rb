Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password/Reset'

  #games Model
  get "/games" => "games#index"
  get "/games/:id" => "games#show"
  post "/games" => "games#create"
  patch "/games/:id" => "games#update"
  delete "/games/:id" => "games#destroy"

  #users Model
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  delete "/users/:id" => "users#destroy"
  patch "/users/:id" => "users#update"
  post "/users/google-login" => "users#google_login"
  post "/users/store_google_data" => "users#store_google_data"
  patch "/users/store_google_data/:id" => "users#store_google_data"

  #sessions Model
  post "/sessions" => "sessions#create"

  #rsvps Model
  get "/rsvps" => "rsvps#index"
  get "/rsvps/:id" => "rsvps#show"
  post "/rsvps" => "rsvps#create"
  delete "/rsvps/:id" => "rsvps#destroy"

   #attendances Model
   get "/my-events" => "attendances#index"
   get "/my-events/:id" => "attendances#show"
   post "/my-events" => "attendances#create"
   delete "/my-events/:id" => "attendances#destroy"

  #products Model
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  #product_images Model
  post "/product_image" => "product_images#create"
  patch "/product_images/:id" => "product_images#update"
  delete "/product_images/:id" => "product_images#destroy"

  #carted_products Model
  post "/carted_products" => "carted_products#create"
  get "/carted_products" => "carted_products#index"
  patch "/carted_products/:id" => "carted_products#update_quantity"

  #events Model
   get "/events" => "events#index"
   get "/events/:id" => "events#show"
   post "/events" => "events#create"
   patch "/events/:id" => "events#update"
   delete "/events/:id" => "events#destroy"

  # orders Model
  get "orders" => "orders#index"
  get "orders/:id" => "orders#show"
  post "/orders" => "orders#create"

  # get "users/forgot-password" => "users#forgot_password"

  # password Model
  resources :password_resets

  resources :users do
    collection do
  #     get 'forgot_password'
  #     post 'send_reset_password_instructions'
  #     get 'reset_password'
      patch 'update_password'
    end
  end
  # resources :users, only: [:show]


end
