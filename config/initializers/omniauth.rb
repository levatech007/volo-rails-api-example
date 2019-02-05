Rails.application.config.middleware.use OmniAuth::Builder do

  OmniAuth.config.full_host = Rails.env.production? ? "https://volo-rails-api.herokuapp.com" : 'http://localhost:8000'
  # provider :facebook,      ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'],   ENV['GOOGLE_SECRET']

end
