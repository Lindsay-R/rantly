Rails.application.routes.draw do
  root "home#show"


  resources :registrations, only: [:new, :create, :update]
  resources :sessions
  resource :home, only: [:show]
  resources :dashboards

  resources :profiles, only: [:show, :edit]



  resources :users do
    resources :rants
  end


  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout




end
