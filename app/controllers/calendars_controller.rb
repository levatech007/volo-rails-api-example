class CalendarsController < ApplicationController
  before_action :authenticate_user!
  require 'date'

    def index
        @calendars = Calendar.all()
        render json: @calendars
    end

    def show
      user_id = current_user.id
      @calendar = Calendar.find(params[:user_id])
      p(Date.today) #use for weather info
      render json: @calendar
    end

    def create
      calendar = Calendar.new(
          location: params[:location],
          date: params[:date],
          notes: params[:notes],
          weather: params[:weather],
          day: params[:day],
          month: params[:month],
          weekday: params[:weekday],
          icon_url: params[:icon_url],
          )
          calendar.user_id = current_user.id
        if calendar.save
          render json: { calendar: calendar }
        end
    end
end
