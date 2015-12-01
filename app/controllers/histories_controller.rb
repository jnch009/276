class HistoriesController < ApplicationController
    def index
        @histories = History.all
    end
    def new
        @history = History.new
        @name = params[:name]
    end
    def delete_all
        History.destroy_all
        flash[:notice] = "Search cleared"
        redirect_to histories_path
    end
end
