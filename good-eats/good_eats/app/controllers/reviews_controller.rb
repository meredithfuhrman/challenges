class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    review_info = review_params
    review_info[:restaurant_id] = params[:restaurant_id]

    @review = Review.create(review_info)
    if @review.save
      flash[:notice] = "Review added"
      redirect_to restaurant_path(review_info[:restaurant_id])
    else
      flash[:notice] = "Invalid entry"
      redirect_to :back
    end
  end

  protected
    def review_params
    params.require(:review).permit(:body, :rating)
    end
end
