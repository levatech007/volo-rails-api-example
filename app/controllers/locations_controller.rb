class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

    def index
        @locations = Location.all()
        render json: @locations
    end

    def show
      location_id = params[:id]
      @location = Location.find(params[:id])
      reviews = Review.where(location_id: location_id)
      all_ratings = reviews.map {|review| review[:rating].to_f}
      avg_rating = (all_ratings.reduce(:+)/all_ratings.length).round(1)
      @location.rating = avg_rating
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
