class FlightsController < ApplicationController
  def get_nonstop_flights
    airport = params[:airport]
    date = params[:date]
    p(airport)
    p(date)
    # retrieve key from Redis
    airport_key = "#{ airport }:nonstop:#{ date }"
    flights = $redis.get(airport_key)
    # render data
    render json: { data: JSON.parse(flights) }
    #
  end
end
