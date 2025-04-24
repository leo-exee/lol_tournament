Rails.application.routes.draw do
  resources :teams
  resources :players
  resources :matches
  resources :results
  
  root "pages#home"


  get "up" => "rails/health#show", as: :rails_health_check
end
