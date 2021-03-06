class Nonstopflights

  def initialize(airport_code, date)
    @airport = airport_code
    @date = date
  end

  def get_flights
    # http://localhost:9292/api/v1/welcome/aircrafts/flights?date=2019-05-01&api_key=api_v1_jpOv71qkn1SbnWur2YAWRw&airport=SFO
    aviation_api_url = "#{ ENV['AVIATION_API_URL'] }/api/v1/welcome/aircrafts/flights?date=#{ @date }&airport=#{ @airport }&api_key=#{ ENV['AVIATION_API_KEY'] }"
    response = RestClient::Request.execute(
      method: :get,
      url: aviation_api_url,
      timeout: 90000000
      )
  end

end
