class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.save ? flash[:success] = t('thanks_message') : flash[:danger] = t('smth_went_wrong')
    redirect_back(fallback_location: root_path)
  end

  private

  def review_params
    params.require(:review).permit(:content, :date, :book_id, :user_id)
  end
end
