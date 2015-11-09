class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
<<<<<<< HEAD
  include SessionsHelper
=======
  helper_method :current_user 

  def current_user 
    @current_username ||= Username.find(session[:username_id]) if session[:username_id] 
  end
  def require_user 
    redirect_to '/login' unless current_user 
  end
>>>>>>> 58bb4843ce034151d6aaca3ce6bae82114f92e5f
end
