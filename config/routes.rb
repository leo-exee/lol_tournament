Rails.application.routes.draw do
  resources :teams
  resources :players
  resources :matches do
    resources :results, only: [ :create ]
  end
  resources :results
  resources :users
  resources :sessions

  root "pages#home"

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  delete "logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check
end
