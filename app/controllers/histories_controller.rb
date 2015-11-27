class HistoriesController < ApplicationController
    def index
        @histories = History.all
        @name = params[:name]
    end
end
