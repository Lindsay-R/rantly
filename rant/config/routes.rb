Rails.application.routes.draw do
  root "home#show"


  resources :registrations, only: [:new, :create]
  resources :sessions
  resource :home, only: [:show]
  resources :dashboard, only: [:show]

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  delete "signout" => "sessions#destroy", as: :signout
end
