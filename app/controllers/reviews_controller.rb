class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end
  def new
    @review = Review.new
  end
  def edit
    @review = current_user.reviews.find(params[:id])
  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = 'Review was successfully created.'
      redirect_to @review
    else
      flash[:notice] = 'Error creating a review'
      render 'new'
    end
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to(@review.booking)
  end
end
