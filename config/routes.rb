Rails.application.routes.draw do

  #games Model
  get "/games" => "games#index"
  get "/games/:id" => "games#show"
  post "/games" => "games#create"
  patch "/games/:id" => "games#update"
  delete "/games/:id" => "games#destroy"

  #users Model
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  delete "/users/:id" => "users#destroy"
  patch "/users/:id" => "users#update"

  #sessions Model
  post "/sessions" => "sessions#create"

  #rsvps Model
  get "/rsvps" => "rsvps#index"
  get "/rsvps/:id" => "rsvps#show"
  post "/rsvps" => "rsvps#create"
  delete "/rsvps/:id" => "rsvps#destroy"

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

  # #Orders Model
  get "orders" => "orders#index"
  get "orders/:id" => "orders#show"
  post "/orders" => "orders#create"

end
