Rails.application.routes.draw do
  post 'providers/info', to: 'providers#info'
  post 'providers/activate', to: 'providers#activate'
  post 'providers/deactivate', to: 'providers#deactivate'
  post 'providers/location', to: 'providers#location'
  post 'clients/location', to: 'clients#location'
  resources :jobs
  resources :sessions
  resources :clients
  resources :providers
  resources :provider_services
end
