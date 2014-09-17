Rails.application.routes.draw do
  root "home#show"


  resources :registrations, only: [:new, :create]
  resources :sessions
  resource :home, only: [:show]
  resources :dashboards

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
end
