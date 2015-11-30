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
                errors.add(:base,"can't be in the past")
            end
        end
    end
    def one_a_day
        if restaurant_date.nil?
        else
            i = 0
            while i != Booking.pluck(:id).count
                foo = Booking.pluck(:restaurant_date)[i].to_formatted_s(:number)
                woo = restaurant_date.to_formatted_s(:number)
                if foo.to_i == woo.to_i
                   errors.add(:base,"You can only reserve once per day") 
                end
                i+=1
            end
        end
    end
end
