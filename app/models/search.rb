class Search < ActiveRecord::Base
    validates :location, presence: true
end
