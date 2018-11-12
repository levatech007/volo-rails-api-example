class UsersController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :json => @user.to_json( :include => :calendars )
    end
  end

end
