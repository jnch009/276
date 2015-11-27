class HistoriesController < ApplicationController
    def index
        @histories = History.all 
        @idstore = params[:idstore]
    end
end
