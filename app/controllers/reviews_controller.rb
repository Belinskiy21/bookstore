class ReviewsController < ApplicationController

  private

  def review_params
    params.require(:review).permit(:content, :date, :book_id, :user_id)
  end
end
