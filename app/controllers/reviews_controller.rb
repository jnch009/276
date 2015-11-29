class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:new,:create]
  def index
    @rest = params[:rest]
    @reviews = Review.all
  end
  def new
    @review = Review.new
    @identity = params[:identity]
    session[:gay] = @identity
  end
  
  def edit
    @review = User.reviews.find(params[:id])
  end
  
  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:notice] = 'Review was successfully created.'
      redirect_to action: "index",rest: session[:gay]
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
	
	def logged_in_user
        unless logged_in?
            flash[:danger] = "You must log in!"
            redirect_to login_path
        end
  end
	
	private
	  def review_params
        	params.require(:review).permit(:reviewer,:body)
    end
end
