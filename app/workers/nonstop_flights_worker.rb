class NonstopFlightsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  require 'date'

  def perform(airport)
    # check flights for today + 6 days
    dates_to_check_for_flights = (Date.today..Date.today + 6).to_a
    # get all locations
    #uniq_airport_codes = Location.select("DISTINCT airport").map(&:airport)
    #uniq_airport_codes.each do |airport|
      dates_to_check_for_flights.each do |date|
        formatted_date = date.to_s # use this date format for API call and Redis key
        redis_expiry_unix_date = (date + 8).to_time.to_i # expires in 8 days
        # create redis key e.g. "SFO:nonstop:2019-05-01" => airport_code:name:date
        airport_date_key = "#{ airport }:nonstop:#{ formatted_date }"
        p(airport_date_key)
        # check if key already exists in redis
        unless $redis.exists(airport_date_key)
            p("No key")
            daily_flights = Nonstopflights.new(airport, formatted_date).get_flights
            # p(daily_flights)
            $redis.set(airport_date_key, daily_flights)
            $redis.expireat(airport_date_key, redis_expiry_unix_date)
            test = $redis.get(airport_date_key)
            p(test)
            # WAIT certain amount of time
        end
      end
    #end
  end

end
