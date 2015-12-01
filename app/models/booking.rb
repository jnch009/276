class Booking < ActiveRecord::Base
    require 'date'
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    #validates :user_id, presence: true
    validates_presence_of :people
    validates :people, numericality: {only_integer: true, less_than_or_equal_to: 30}
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
            if t.to_i >= 0 && time.to_i < 800
                t = time.to_i + 1600
            else
                t = time.to_i - 800
            end
            if foo.to_i < woo.to_i && booktime < t
                errors.add(:base,"Booking day/Time has already passed")
            end
        end
    end
end
