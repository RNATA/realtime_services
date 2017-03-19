Rails.application.routes.draw do
  post 'providers/info', to: 'providers#info'
  post 'providers/activate', to: 'providers#activate'
  resources :sessions
  resources :clients
  resources :providers
  resources :provider_services
end
