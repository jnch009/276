class BookingsController < ApplicationController
    before_action :logged_in_user
    def new
        @identity = params[:identity]
        @booking = Booking.new
    end
    def create
        @booking = Booking.new(booking_params)
		if @search.save
    		redirect_to @search
    		#render @search
  		else
    		flash.now[:danger] = 'Invalid search combination'   		    
    		render 'new'
  		end
    end
    
    def logged_in_user
        unless logged_in?
            flash[:danger] = "You must log in!"
            redirect_to login_path
        end
    end
    private
      	def booking_params
        	params.require(:search).permit(:FirstName,:LastName,:Phone,:Time)
      	end
    
end
