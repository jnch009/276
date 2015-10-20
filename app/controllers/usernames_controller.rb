class UsernamesController < ApplicationController
  def new
    @username = Username.new
  end
  
  def create 
    @username = Username.new(username_params) 
    if @username.save 
      session[:username_id] = @username.id 
      redirect_to '/' 
    else 
      redirect_to '/signup' 
    end 
  end
    
  private
  def username_params
    params.require(:username).permit(:first_name,:last_name,:email,:password)
  end
end
