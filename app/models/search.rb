class Search < ActiveRecord::Base
    validates :location, presence: true
    validates :slimit, numericality: {only_integer: true,greater_than_or_equal_to: 1,less_than_or_equal_to:20}
    
end
