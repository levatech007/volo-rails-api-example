class UsersController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]

  def index
    @users = User.all
    render json: @users
  end

  def show
    user_id = current_user.id
    @user = User.find_by_id(id: user_id)
    render json: @user
  end
end
