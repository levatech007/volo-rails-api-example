class CalendarsController < ApplicationController
  before_action :authenticate_user!

    def index
        @calendars = Calendar.all()
        render json: @calendars
    end

    def create
      @calendar = Calendar.new(
          location: params[:location],
          date: params[:date],
          notes: params[:notes],
          weather: params[:weather],
          day: params[:day],
          month: params[:month],
          weekday: params[:weekday],
          icon_url: params[:icon_url],
          )
          @calendar.user_id = current_user.id
        if @calendar.save
          render json: { calendar: @calendar }, status: :ok
        else
          render json: { error: "Can not save entry"}, status: :bad_request
        end
    end

    def destroy
      @calendar = Calendar.find_by_id(params[:id])
      if current_user.id == @calendar.user_id && @calendar
        @calendar.destroy
        render json: {}, status: :ok
      else
        render json: { error: "Calendar entry not found"}, status: :not_found
      end

    end
end
