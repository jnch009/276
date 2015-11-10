class SearchesController < ApplicationController
    def index
    	@searches = Search.all
    end
    
    def new 
        @search = Search.new
    end
    
    def create
        @search = Search.new(search_params)
		if @search.save
    		redirect_to @search
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
        	params.require(:search).permit(:restname,:city,:state)
      	end
end
