class LocationsController < ApplicationController
  #before_action :authenticate_user!, except: [ :index ]
    def index
        @locations = Location.all()
        render json: @locations
    end

    def show
      @location = Location.find(params[:id])
      # render json: @location
      render :json => @location.to_json( :include => :reviews )
    end



    def create
        @location = Location.create(
            name: params[:name],
            airport: params[:airport],
            rating: params[:rating]
            )
        render json: { location: @location }
    end
end
