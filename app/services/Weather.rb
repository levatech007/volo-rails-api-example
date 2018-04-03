class Weather

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def get_forecast
    response = RestClient::Request.execute(
      method: :get,
      url: "http://api.openweathermap.org/data/2.5/forecast?lat=#{@lat}&lon=#{@lon}&units=imperial&APPID=#{ ENV['WEATHER_API_KEY'] }"
      )
      @json_response = JSON.parse(response)
      @filtered_weather = []
      @json_response['list'].each do |one_forecast|
        t = Time.at(one_forecast['dt'])
        adj_t = t - (60*60*3)
        if adj_t.hour == 14 || adj_t.hour == 2
          day_forecast = {
            'date' => adj_t,
            'day' => adj_t.day,
            'month' => MONTHS.find {|key, val| key === adj_t.month }.last,
            'day_of_week' => DAYS_OF_WEEK.find {|key, val| key === adj_t.wday }.last,
            'wind_dir' => WIND_DIRECTIONS.find {|key, val| key === one_forecast['wind']['deg'].round }.last,
            'wind_speed' => one_forecast['wind']['speed'].round,
            'temp' => one_forecast['main']['temp'].round,
            'conditions_icon' => ICON_URL.find {|key, val| key === one_forecast['weather'][0]['id']}.last,
            'conditions_txt' => one_forecast['weather'][0]['main']
          }
          @filtered_weather << day_forecast
          # @filtered_weather << one_forecast
        end
      end

      return @filtered_weather
  end
end
