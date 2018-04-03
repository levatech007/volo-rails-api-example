class Weather

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def get_forecast
    #wind direction degree range => letter degree
    wind_directions = {
      0..11=> 'N', 12..33=> 'NNE', 34..56=> 'NE', 57..78=> 'ENE',
      79..101=> 'E', 102..123=> 'ESE', 124..146=> 'SE',147..168=> 'SSE',
      169..191=> 'S',192..213=> 'SSW',214..236=> 'SW',237..258=> 'WSW',
      259..281=> 'W',282..303=> 'WNW',304..326=> 'NW',327..348=> 'NNW',
      349..360=> 'N',
    }
    days_of_week = {
      0 => 'Sunday', 1 => 'Monday', 2 => 'Tuesday', 3 => 'Wednesday', 4 => 'Thursday', 5 => 'Friday', 6 => 'Saturday'
    }
    months = {
      1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June',
      7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December'
    }
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
            'month' => months.find {|key, val| key === adj_t.month }.last,
            'day_of_week' => days_of_week.find {|key, val| key === adj_t.wday }.last,
            'wind_dir' => wind_directions.find {|key, val| key === one_forecast['wind']['deg'].round }.last,
            'wind_speed' => one_forecast['wind']['speed'].round,
            'temp' => one_forecast['main']['temp'].round,
            'conditions' => one_forecast['weather'][0]['id'],
            
          }
          @filtered_weather << day_forecast
        end
      end

      return @filtered_weather
  end
end
