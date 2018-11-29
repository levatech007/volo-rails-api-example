class Forecast

  def initialize(lat, lon, location_id, timezone)
    @lat = lat
    @lon = lon
    @location_id = location_id
    @timezone = timezone #for future use to adjust weather forecast to user timezone
  end

  def get_forecast
    response = RestClient::Request.execute(
      method: :get,
      url: "https://api.openweathermap.org/data/2.5/forecast?lat=#{@lat}&lon=#{@lon}&units=imperial&APPID=#{ ENV['WEATHER_API_KEY'] }"
      )
      @json_response = JSON.parse(response)
      @filtered_response = []

      @json_response['list'].each do |forecast|
        t = Time.at(forecast['dt'])
        adj_t = t - (60*60*3)
        @filtered_response << forecast if adj_t.hour == 15 || adj_t.hour == 3 #select only 2 forecasts per day (hours 3pm/15:00 and 3am/3:00)
      end
      p(@filtered_response)
      @filtered_response.each_with_index do |one_forecast, idx|
        t = Time.at(one_forecast['dt'])
        adj_t = t - (60*60*3)
        if idx.even? #even idx is main forecast used for the day
          location = Location.find_by_id(@location_id)
          weather = Weather.new(
            # format weather info:
            date: one_forecast['dt'],
            day: adj_t.day,
            month: MONTHS.find {|key, val| key === adj_t.month }.last,
            day_of_week: DAYS_OF_WEEK.find {|key, val| key === adj_t.wday }.last,
            wind_dir: WIND_DIRECTIONS.find {|key, val| key === one_forecast['wind']['deg'].round }.last,
            wind_speed: one_forecast['wind']['speed'].round,
            high_temp: one_forecast['main']['temp'].round,
            low_temp: @filtered_response[idx+1]['main']['temp'].round, #add nighttime low temp from odd idx
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
