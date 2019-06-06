# Gets weather forecast for a location based on its latitude and longitude
class Forecast

  # Using Openweathermap API (free)
  # The API uses military time clock.
  # Current API call only uses Imerial units. Add metric later on.
  # It is based in Russia and seems sensitive to daylight savings time changes when using in Localhost.
  # I've had to adjust it every time we turn clock.
  # Seems to work well in Heroku though.
  # Need to research timekeeping more as there are still a lot of bugs.
  # The weather formatting is done to send complete information to FE

  def initialize(lat, lon, location_id, timezone)
    @lat = lat
    @lon = lon
    @location_id = location_id
    @timezone = timezone #for future use to adjust weather forecast to location timezone
  end
  # To get necessary weather data, the best option was to use 5-day/3-hour forecast.
  # then filter out data that matches two different hours of the day: one middle of day for high, middle of night for low
  def get_forecast
    response = RestClient::Request.execute(
      method: :get,
      url: "https://api.openweathermap.org/data/2.5/forecast?lat=#{@lat}&lon=#{@lon}&units=imperial&APPID=e80326d458fab8fff20d7e2dda2fbd43"
      )
      @json_response = JSON.parse(response)
      @filtered_response = []
      # filter data here to include only 2 forecasts per day
      @json_response['list'].each do |forecast|
        # forecast['dt'] is Unix timestamp
        date_time = Time.at(forecast['dt']) # date string
        adjusted_to_timezone = date_time - (60*60*3) # time adjusted to current timezone (this probably throws off the time adjustments. Needs revision.)

        if Rails.env.development? # if Rails does not show any weather data saved, check the adj time as it may have changed
          @filtered_response << forecast if adjusted_to_timezone.hour == 13 || adjusted_to_timezone.hour == 1 # works in dev, not heroku
        else
          @filtered_response << forecast if adjusted_to_timezone.hour == 15 || adjusted_to_timezone.hour == 3 # works in Heroku, not in dev
        end
      end

      # format data for database
      @filtered_response.each_with_index do |one_forecast, idx|
        date_time = Time.at(one_forecast['dt']) # date string
        adjusted_to_timezone = date_time - (60*60*3)
        if idx.even? # Even idx is main forecast used for the day if pulled before the daytime hour specified in @filtered_response
          location = Location.find_by_id(@location_id)
          weather = Weather.new(
            # format weather
            date: adjusted_to_timezone,
            day: adjusted_to_timezone.day, # day as int
            month: MONTHS.find {|key, val| key === adjusted_to_timezone.month }.last, # month string, e.g. "April"
            day_of_week: DAYS_OF_WEEK.find {|key, val| key === adjusted_to_timezone.wday }.last, # day name, e.g. "Tuesday"
            wind_dir: WIND_DIRECTIONS.find {|key, val| key === one_forecast['wind']['deg'].round }.last, # string e.g. "NW"
            wind_speed: one_forecast['wind']['speed'].round, # MPH
            high_temp: one_forecast['main']['temp'].round, # day temperature in F
            low_temp: @filtered_response[idx+1]['main']['temp'].round, # nighttime low temp in F from odd idx
            conditions_icon: ICON_URL.find {|key, val| key === one_forecast['weather'][0]['id']}.last, # icon url to be used in FE
            conditions_txt: one_forecast['weather'][0]['main'], # general weather description
          )
            weather.location_id = location.id
            weather.save
          end
        end
  end

end
