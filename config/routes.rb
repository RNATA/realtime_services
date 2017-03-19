Rails.application.routes.draw do
  post 'providers/info', to: 'providers#info'
  resources :sessions
  resources :clients
  resources :providers
  resources :provider_services
end
