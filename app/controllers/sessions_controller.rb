class SessionsController < ApplicationController
    def new
    end
    
     def create
        @username = Username.find_by_email(params[:session][:email])
        if @username && @username.authenticate(params[:session][:password])
            session[:username_id] = @username.id
            redirect_to '/'
        else
            redirect_to 'login'
        end
     end
     
     def destroy 
        session[:username_id] = nil 
        redirect_to '/' 
     end
end
