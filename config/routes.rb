Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount_devise_token_auth_for 'User', at: 'auth'
  # root :to => "controller#action"
  # LOCATIONS
  get "locations", to: "locations#index"
  post "locations", to: "locations#create"
  get "locations/:id", to: "locations#show"
  patch "locations/:id"  , to: "locations#update"
  put "locations/:id", to: "locations#update"
  delete "locations/:id", to: "locations#destroy"
  get "locations/:id/weather", to: "locations#weather", as: "location_weather"
  # REVIEWS
  get "reviews", to: "reviews#index"
  post "reviews", to: "reviews#create"
  delete "reviews/:id ", to: "reviews#destroy"
  # CALENDARS
  get "calendars", to: "calendars#index" # dev only
  post "calendars", to: "calendars#create"
  delete "calendars/:id", to: "calendars#destroy"

  resources :users # dev only!
  # EMAIL LIST
  post "subscribe", to: "email_list#create", as: "subscribe"
end
