class BookingsController < ApplicationController
    before_action :logged_in_user
    def new
        @booking = Booking.new
        @identity = params[:identity]
    end
    def create
        @booking = Booking.new(booking_params)
		if @booking.save
		    flash[:notice] = 'Reservation successfully created'
    		redirect_to histories_path
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
        	params.require(:booking).permit(:FirstName,:LastName,:Phone,:Time)
      end
    
end
