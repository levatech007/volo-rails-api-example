# handles flight related requests from Volo Flight API
class FlightsController < ApplicationController

  def get_nonstop_flights
    @airport = params[:airport] # 3 digit IATA airport code
    @date = params[:date] # "YYYY-MM-DD"
    aircraft = params[:aircraft] # first 2 digits of aircraft IATA code (two first are always the same for plane type, regardless of variants)

    aviation_api_url = "#{ ENV['AVIATION_API_URL'] }/api/v1/welcome/aircrafts/flights?date=#{ @date }&airport=#{ @airport }&api_key=#{ ENV['AVIATION_API_KEY'] }"
    response = RestClient::Request.execute(
      method: :get,
      url: aviation_api_url,
      timeout: 90000000
      ){ |response|
          if response.code == 200

            all_flights = JSON.parse(response)
            # same aircraft type can have several variants (e.g. Boeing 747-8,  Boeing 747-4 )
            # find flights of all variants of the aircraft
            flights_by_aircraft = all_flights.select { |key, _| key[0] == aircraft[0] && key[1] == aircraft[1]}
            # get the total flights count of all variants (needed for pagination in FE)
            total_flights = flights_by_aircraft.inject(0) { |total, (aircraft,flights)| total + flights.length }

            unless flights_by_aircraft.empty?
              render json: { data: flights_by_aircraft, total_flights: total_flights }, status: :ok
            else
              render json: { error: "No flights found"}, status: :not_found
            end
          else
            render json: { error: "No flights found"}, status: :not_found
          end
        }
  end
end
