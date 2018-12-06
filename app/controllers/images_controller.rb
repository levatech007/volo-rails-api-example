class ImagesController < ApplicationController
  # before_action :authenticate_user!

  def show
    #return only last image? later =>  image.active == true

  end

  def create
    # add uploaded image to user
    @image = Image.new
    @image.avatar = params[:avatar]
    #@image.active = true, set all others to false?
    @image.user_id = current_user.id
    @image.save! #remove and don't save if its there is no image
    if @image.avatar.file.nil?
      render json: { error: "Something went wrong" }, status: :bad_request
    else
      render json: { message: "Successfully saved" }, status: :ok
    end
  end

end
