Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :locations
  resources :reviews
  resources :calendars
  resources :users
  get "locations/:id/weather", to: "locations#weather", as: "location_weather"
end
