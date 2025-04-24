Rails.application.routes.draw do
  resources :teams
  resources :players
  resources :matches do
    resources :results, only: [ :create ]
  end
  resources :results

  root "pages#home"


  get "up" => "rails/health#show", as: :rails_health_check
end
