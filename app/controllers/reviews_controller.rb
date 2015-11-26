class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end
  
  def new
    @review = Review.new
  end
  
  def edit
    @review = User.reviews.find(params[:id])
  end
  
  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = 'Review was successfully created.'
      render action: "index"
    else
      flash[:notice] = 'Error creating a review'
      render 'new'
    end
  end
    
  def update
	 	@review = User.reviews.find(params[:id])
 	 	if @review.update(review_params)
 	 		  redirect_to @review
  	else
  			render 'edit'
  	end
  end
  
	def destroy
  		@review = User.reviews.find(params[:id])
  		@review.destroy
  		redirect_to reviews_path
	end
end
