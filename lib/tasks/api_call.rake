namespace :api_call do
  desc "Get weather forecast"
  task weather: :environment do
    # GetWeatherForecastJob.perform_later
    p("Hello world!")
  end

end
