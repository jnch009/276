class BookingsController < ApplicationController
    before_action :logged_in_user
    before_action :correct_user, only: :destroy
    def index
        @bookings = Booking.all
    end
    def new
        @booking = Booking.new
        @identity = params[:identity]
        session[:fag] = @identity
        Rails.cache.write("name",@identity)
    end
    def create
        @booking = current_user.bookings.build(booking_params)
		if @booking.save
		    flash[:notice] = 'Successfully booked this restaurant'
		    redirect_to new_history_path(:name => Rails.cache.read("name"))
  		else
    		#flash[:danger] = 'Invalid booking'  
    		redirect_to new_booking_path(:identity => session[:fag]), :flash => {:error => @booking.errors.full_messages.join("  ").html_safe}
  		end
    end
    def destroy
        @booking.destroy
        flash[:success] = "Booking deleted"
        redirect_to request.referrer || root_path
    end
        
    
    def logged_in_user
        unless logged_in?
            flash[:danger] = "You must log in!"
            redirect_to login_path
        end
    end
    
    private
      def booking_params
        	params.require(:booking).permit(:restaurant_date,:Time)
      end
      def correct_user
        @booking = current_user.bookings.find_by(id: params[:id])
        redirect_to root_path if @booking.nil?
      end
    
end
