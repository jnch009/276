class Booking < ActiveRecord::Base
    require 'date'
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    #validates :user_id, presence: true
    validates :restaurant_date, presence: true
    validate :year2015
    validate :one_a_day
    
    def year2015
        if restaurant_date.nil?
        else
            foo = restaurant_date.to_formatted_s(:number)
            foo = foo[0,4]
            if foo.to_i < 2015
                errors.add(:restaurant_date,"can't be in the past")
            end
        end
    end
    def one_a_day
        if Booking.exists? restaurant_date: restaurant_date
            errors.add :restaurant_date,'You already have a reservation today, you may reserve one table a day'
        end    
    end
end
