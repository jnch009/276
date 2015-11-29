class SearchesController < ApplicationController
    def index
        @searches = Search.all
    end
    def new 
        @search = Search.new
    end
    def create
    if logged_in?
        @search = current_user.searches.build(search_params)
    else    
        @search = Search.new(search_params)
    end
		if @search.save
            redirect_to @search
    		#render @search
  		else
    		flash.now[:danger] = 'Invalid search combination'   		    
    		render 'new'
  		end
    end
    def show 
	    @search = Search.find(params[:id])
    end
    
    private
      	def search_params
        	params.require(:search).permit(:restname,:location,:slimit,:offset,:sort)
      	end
end
