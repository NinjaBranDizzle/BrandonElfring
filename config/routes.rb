Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token

  # Dashboard (authenticated users)
  get "dashboard", to: "dashboard#show"

  # Root route - login page
  root "sessions#new"

  # Health check for load balancers
  get "up" => "rails/health#show", as: :rails_health_check
end
