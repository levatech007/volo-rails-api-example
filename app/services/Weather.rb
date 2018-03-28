class Weather

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def get_forecast
    # p("http://api.openweathermap.org/data/2.5/weather?lat=#{@lat}&lon=#{@lon}&APPID=#{ ENV['WEATHER_API_KEY'] }")
    response = RestClient::Request.execute(
      method: :get,
      url: "http://api.openweathermap.org/data/2.5/forecast?lat=#{@lat}&lon=#{@lon}&units=imperial&APPID=#{ ENV['WEATHER_API_KEY'] }"
      )
      p(JSON.parse(response))
  end
end
