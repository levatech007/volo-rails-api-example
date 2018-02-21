class LocationsController < ApplicationController
  #before_action :authenticate_user!, except: [ :index ]
    def index
        @locations = Location.all()
        render json: @locations
    end

    def create
        location = Location.create(
            name: params[:name],
            airport: params[:airport],
            rating: params[:rating]
            )
        render json: { location: location }
    end
end
