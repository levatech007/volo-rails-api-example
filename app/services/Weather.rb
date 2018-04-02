class Weather

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end


  def get_forecast
    wind_directions = {
      0..11=> "N",
      12..33=> "NNE",
      34..56=> "NE",
      57..78=> "ENE",
      79..101=> "E",
      102..123=> "ESE",
      124..146=> "SE",
      147..168=> "SSE",
      169..191=> "S",
      192..213=> "SSW",
      214..236=> "SW",
      237..258=> "WSW",
      259..281=> "W",
      282..303=> "WNW",
      304..326=> "NW",
      327..348=> "NNW",
      349..360=> "N",
    }
    response = RestClient::Request.execute(
      method: :get,
      url: "http://api.openweathermap.org/data/2.5/forecast?lat=#{@lat}&lon=#{@lon}&units=imperial&APPID=#{ ENV['WEATHER_API_KEY'] }"
      )
      @json_response = JSON.parse(response)
      @filtered_weather = []
      @json_response['list'].each do |time|
        t = Time.at(time['dt'])
        adj_t = t - (60*60*3)
        if adj_t.hour == 14 || adj_t.hour == 2
          day_forecast = {
            'date' => adj_t,
            'wind_dir' => wind_directions.find {|key, val| key === time['wind']['deg'].round }.last,
            'wind_speed' => time['wind']['speed'],
            'temp' => time['main']['temp'],
            'conditions' => time['weather'][0]['id'],
          }
          @filtered_weather << day_forecast
        end
      end

      return @filtered_weather
  end
end
