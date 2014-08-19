Rails.application.routes.draw do
  root "dashboard#show"


  resources :registrations, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  delete "signout" => "sessions#destroy", as: :signout
end
