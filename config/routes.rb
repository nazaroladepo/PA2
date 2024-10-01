Rails.application.routes.draw do
  resources :movies
  root to: redirect("/movies")
  # get '/manifest.json', to: 'application#manifest'
end
