Rails.application.routes.draw do

  root to: "welcome#home"

  #sessions
  get 'signin' => 'sessions#new'
  post "/signin", to: "sessions#create"
  post 'sessions/create' => 'sessions#create'
  delete "/signout", to: "sessions#destroy"
  delete 'sessions/destroy' => 'sessions#destroy', :as => 'logout'

  #attractions
  resources :attractions

  #users
  resources :users

  #rides
  post 'rides/create' => 'rides/create'
end
