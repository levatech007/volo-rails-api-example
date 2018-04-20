class WeatherforecastWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "I am busy mailing newsletter."
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
