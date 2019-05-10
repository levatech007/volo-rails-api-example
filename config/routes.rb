Rails.application.routes.draw do
  require 'devise_token_auth'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount_devise_token_auth_for 'User', at: 'auth', controllers: { omniauth_callbacks: 'overrides/omniauth_callbacks' }
  root to: "documentation#index"

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
  post "calendars", to: "calendars#create"
  delete "calendars/:id", to: "calendars#destroy"

  #CONTACT FORM PROCESSING
  post "message", to: "messages#create"

  if Rails.env.development?
    get "calendars", to: "calendars#index"
    resources :users
  end
  # EMAIL LIST
  post "subscribe", to: "email_list#create", as: "subscribe"

  # USER PROFILE IMAGE UPLOAD
  get "image", to: "images#show"
  post "images", to: "images#create"

  # AVIATION API RELATED
  get "documentation", to: "api#get_documentation"

  # FLIGHTS CONTROLLER
  get "nonstopflights/:airport/:date", to: "flights#get_nonstop_flights"
end
