class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :json => @user.to_json( :include => [:calendars, :reviews, :images] )
    else
      render json: { error: "Unauthorized"}, status: :unauthorized
    end
  end

end
