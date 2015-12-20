class SearchesController < ApplicationController
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
            redirect_to search_path(@search,i: 0) # passing parameter i
    		#render action: "index"
  		else
    		flash[:danger] = 'Invalid search combination'   		    
    		redirect_to new_search_path
  		end
    end
    def show 
        @i = params[:i]
	    @search = Search.find(params[:id])
    end
    
    private
      	def search_params
        	params.require(:search).permit(:restname,:location,:sort)
      	end
end
