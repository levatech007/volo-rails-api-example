class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]

    def index
        @reviews = Review.all()
        render json: @reviews
    end

    def create
      review = Review.new(
        author: params[:author],
        content: params[:content],
        rating: params[:rating],
        title: params[:title],
      )
      location = Location.find(params[:location_id])
      review.location_id = location.id
      review.user_id = current_user.id
      if review.save
        render json: {review: review}
      end
    end


end
