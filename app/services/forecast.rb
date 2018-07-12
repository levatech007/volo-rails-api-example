class Forecast

  def initialize(lat, lon, location_id, timezone)
    @lat = lat
    @lon = lon
    @location_id = location_id
    @timezone = timezone
  end

  def get_forecast
    p("Getting weather info!")
    response = RestClient::Request.execute(
      method: :get,
      url: "https://api.openweathermap.org/data/2.5/forecast?lat=#{@lat}&lon=#{@lon}&units=imperial&APPID=#{ ENV['WEATHER_API_KEY'] }"
      )
      @json_response = JSON.parse(response)
      p(@json_response)
      @filtered_response = []

      @json_response['list'].each do |forecast|
        t = Time.at(forecast['dt'])
        adj_t = t - (60*60*3)
        p(adj_t)
        @filtered_response << forecast if adj_t.hour == 15 || adj_t.hour == 3
      end

      p(@filtered_response)

      @filtered_response.each_with_index do |one_forecast, idx|
        t = Time.at(one_forecast['dt'])
        adj_t = t - (60*60*3)
        if idx.even?
          location = Location.find_by_id(@location_id)
          weather = Weather.new(
            date: adj_t,
            day: adj_t.day,
            month: MONTHS.find {|key, val| key === adj_t.month }.last,
            day_of_week: DAYS_OF_WEEK.find {|key, val| key === adj_t.wday }.last,
            wind_dir: WIND_DIRECTIONS.find {|key, val| key === one_forecast['wind']['deg'].round }.last,
            wind_speed: one_forecast['wind']['speed'].round,
            high_temp: one_forecast['main']['temp'].round,
            low_temp: @filtered_response[idx+1]['main']['temp'].round,
            conditions_icon: ICON_URL.find {|key, val| key === one_forecast['weather'][0]['id']}.last,
            conditions_txt: one_forecast['weather'][0]['main'],
          )
            weather.location_id = location.id
            weather.save
            p(weather)
          end
        end
  end

end
