# Get Weather Forecast for all locations
class WeatherforecastWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    # weather data needs to be moved to Redis instead of postgres
    # it should then expire in no more than a week

    # The weather forecast gets duplicated in Heroku somehow.
    # It shows the weather forecast for 5 days and then repeats it again. Data comes like that from database, not a FE error.
    # Have not been able to trace the issue. Maybe someting to do with SimpleScheduler and Heroku Scheduler working simultaneously?
    # Moving forecast to Redis should fix that.

    Weather.destroy_all
    locations = Location.all
    locations.each do |location|
      @lat = location.latitude
      @lon = location.longitude
      @timezone = location.timezone
      @location_id = location.id
      @weather_f = Forecast.new(@lat,@lon,@location_id,@timezone)
      @weather_f.get_forecast()
    end
  end
end
