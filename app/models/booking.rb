class Booking < ActiveRecord::Base
    require 'date'
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    #validates :user_id, presence: true
    validates :restaurant_date, presence: true
    validate :one_a_day
    validate :year2015
    
    def year2015
        foo = restaurant_date.to_formatted_s(:number)
        foo = foo[0,4]
        if foo.to_i < 2015
            errors.add(:restaurant_date,"can't be in the past")
        end
    end
    def one_a_day
        i= 0
        while i < Booking.pluck(:Time).count
            if restaurant_date.to_s(:db) == Booking.pluck(:restaurant_date)[i]
                errors.add(:restaurant_date,": You have already booked a restaurant today. You may only have one reservation a day.")
            end
        end
    end
end
