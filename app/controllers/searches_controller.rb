class SearchesController < ApplicationController
    def show 
	    @search = Search.find(params[:id])
    end
    def new 
        @search = Search.new
    end
    def create
        @search = Search.new(search_params)
		if @search.save
    		#render action: "index"
    		redirect_to @search
  		else
    		flash.now[:danger] = 'Invalid search combination'   		    
    		render 'new'
  		end
    end
    
    private
      	def search_params
        	params.require(:search).permit(:restname,:location,:slimit)
      	end
end
