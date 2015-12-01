class BookingsController < ApplicationController
    #before_action :logged_in_user
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
    		render :template => "bookings/_form", :locals => {:identity => session[:fag]}
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
        	params.require(:booking).permit(:restaurant_date,:time,:people)
      end
      def correct_user
        time = Time.now
        time = time.strftime("%H%M")
        if time.to_i >= 0 && time.to_i < 800
            time = time.to_i + 1600
        else
            time = time.to_i - 800
        end
        woo = Date.today.to_formatted_s(:number)
        datatime = current_user.bookings.find_by(id: params[:id]).time
        datatime = datatime.strftime("%H%M").to_i
        datadate= current_user.bookings.find_by(id: params[:id]).restaurant_date#.to_i > time.abs && 
        datadate= datadate.to_formatted_s(:number)
        if datadate.to_i >= woo.to_i && datatime > time
            @booking = current_user.bookings.find_by(id: params[:id])
        else
            flash[:danger] = "This reservation time has already passed."
            redirect_to histories_path if @booking.nil?
        end
      end
    
end
