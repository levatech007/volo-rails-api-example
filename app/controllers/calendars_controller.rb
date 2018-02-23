class CalendarsController < ApplicationController
  #before_action :authenticate_user!, except: [ :index ]
    def index
        @calendars = Calendar.all()
        render json: @calendars
    end

    # def show
    #
    # end

    def create
        calendar = Calendar.create(
            location: params[:location],
            date: params[:date],
            notes: params[:notes],
            weather: params[:weather]
            )
        render json: { calendar: calendar }
    end
end
