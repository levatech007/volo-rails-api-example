# handle user profile image uploads and requests
class ImagesController < ApplicationController
  before_action :authenticate_user!

  def show
    #return only last image? later =>  image.active == true
    @image = Image.find_by( user_id: current_user.id )
    render json: { image: @image }, status: :ok
  end

  def create
    @image = Image.new
    @image.avatar = params[:avatar]
    @image.user_id = current_user.id
     #remove and don't save if its there is no image
    if @image.save! && !@image.avatar.file.nil?
      render json: { error: "Something went wrong" }, status: :bad_request
    else
      render json: { message: "Successfully saved" }, status: :ok
    end
  end

end
