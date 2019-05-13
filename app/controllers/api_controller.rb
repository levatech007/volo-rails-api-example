class ApiController < ApplicationController
  require 'rest-client'

  def get_documentation
    response = RestClient.get ENV['API_URL']
    render json: { documentation:  JSON.parse(response)}, status: :ok
  end

end
