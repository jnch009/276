class Booking < ActiveRecord::Base
    has_many :reviews
end
