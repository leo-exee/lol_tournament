Rails.application.routes.draw do
  resources :teams
  resources :players
  resources :matches
  resources :results

  root "matches#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
