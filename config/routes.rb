Rails.application.routes.draw do
  resources :sessions
  resources :clients
  resources :providers
  resources :provider_services
end
