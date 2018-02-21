class ReviewsController < ApplicationController
  #before_action :authenticate_user!, except: [ :index ]
    def index
        @reviews = Review.all()
        render json: @reviews
    end

    def create
        review = Review.create(
            author: params[:author],
            content: params[:content],
            rating: params[:rating]
            )
        render json: { review: review }
    end

    # def destroy
    # end
end
