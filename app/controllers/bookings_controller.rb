class BookingsController < ApplicationController
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
    
end
