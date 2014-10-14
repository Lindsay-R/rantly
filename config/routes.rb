Rails.application.routes.draw do
  root "home#show"

  resources :registrations, only: [:new, :create, :update]
  resources :sessions
  resource :home, only: [:show]
  resources :dashboards
  resources :profiles, only: [:show, :edit]
  resources :searches, only: [:index]
  resources :followings, only: [:index, :show]
  resources :favorites, only: [:index]


  resources :users do
    post 'follow' => 'following_relationships#create'
    delete 'follow' => 'following_relationships#destroy'

      resources :rants do
      post 'favorite' => 'favorites#create'
      delete 'favorite' => 'favorites#destroy'
      end
  end


  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout




end
