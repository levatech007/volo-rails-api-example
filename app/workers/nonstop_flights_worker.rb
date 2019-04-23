class NonstopFlightsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  require 'date'

  def perform
    todays_date = Date.today.to_s
    p(todays_date)
    # get all locations
    airport_codes = Location.select("DISTINCT airport").map(&:airport)
    airport_codes.each do |airport|
      date = todays_date.delete("-") # use this date format for API call and Redis key
      # create redis key "SFO:nonstop:20190501" => airport_code:name:date
      redis_key = "#{ airport }:nonstop:#{ date }"
      $redis.set('test', 'it worked!')
      # $redis.expire(varriable, time)
      test = $redis.get('test')
      # run loop for all days of the week
      # check if entry for the date already exists in Redis
      # if not:

      # daily_flights = NonStopFlights.new(airport, date).get_flights
      # set in Redis with expiration date + 7 days

    end

  end
end
