class CalendarsController < ApplicationController
  # before_action :authenticate_user!
    def index
        @calendars = Calendar.all()
        render json: @calendars
    end

    def show
      @calendar = Calendar.find(params[:user_id])
      render json: @calendar
    end

    def create
      calendar = Calendar.create(
          location: params[:location],
          date: params[:date],
          notes: params[:notes],
          weather: params[:weather],
          )
      render json: { calendar: calendar }
    end
end
