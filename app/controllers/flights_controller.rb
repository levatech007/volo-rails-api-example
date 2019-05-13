class FlightsController < ApplicationController
  def get_nonstop_flights
    airport = params[:airport] # 3 digit IATA airport code
    date = params[:date] # "YYYY-MM-DD"
    aircraft = params[:aircraft] # first 2 digits of aircraft IATA code (two first are always the same for plane type, regardless of variants)
    # retrieve key from Redis
    airport_key = "#{ airport }:nonstop:#{ date }"
    flights = $redis.get(airport_key)
    all_flights = JSON.parse(flights)
    # match the first 2 digits of keys in all_flights
    # returning matching value
    flights_by_aircraft = all_flights.select { |key, _| key[0] == aircraft[0] && key[1] == aircraft[1]}
    # render data
    render json: { data: flights_by_aircraft }
    #
  end
end
