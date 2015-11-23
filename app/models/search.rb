class Search < ActiveRecord::Base
    #validates :restname, presence: true
    #validates :city, presence: true
    #validates :state, presence: true
    validates :location, presence: true
end
