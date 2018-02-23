class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]

    def index
        @reviews = Review.all()
        render json: @reviews
    end

    def create
      # p(user)
      p(params)
      p(current_user)
      @review = Review.new(
        author: params[:author],
        content: params[:content],
        rating: params[:rating]
      )
      location = Location.find(params[:location_id])
      user = User.find(params[:user_id])

      @review.user_id = user.id
      @review.location_id = location.id
      # @review.user_id = @user.id #may need revision
      if @review.save
        render json: {review: @review}
      end
    end

    private

    def review_params
        params.require(:review).permit(:author, :content, :rating)
    end
    # def destroy
    # end
end
