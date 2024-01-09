Rails.application.routes.draw do

  #Games Model
  get "/games" => "games#index"
  get "/games/:id" => "games#show"
  post "/games" => "games#create"
  patch "/games/:id" => "games#update"
  delete "/games/:id" => "games#destroy"

  #Users Model
  post "/users" => "users#create"

  #Rsvps Model
  get "/rsvps" => "rsvps#index"
  get "/rsvps/:id" => "rsvps#show"
  post "/rsvps" => "rsvps#create"

end
