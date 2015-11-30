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
            woo = Date.today.to_formatted_s(:number)
            foo = restaurant_date.to_formatted_s(:number)
            booktime = time.strftime("%H%M").to_i
            t = Time.now
            t = t.strftime("%H%M")
            t = t.to_i - 800
            if foo.to_i < woo.to_i && booktime < t.abs
                errors.add(:base,"Booking day/Time has already passed")
            end
        end
    end
end
