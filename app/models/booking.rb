class Booking < ActiveRecord::Base
    require 'date'
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    #validates :user_id, presence: true
    validates_presence_of :restaurant_date
    validates_uniqueness_of :user_id, scope: [:restaurant_date], message: "has already booked a restaurant on this date"
    validate :year2015
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
end
